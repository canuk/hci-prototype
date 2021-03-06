class PagesController < ApplicationController

    def word_cloud
      @prompt = Prompt.find(params[:id].to_i)
      ans = Answer.where(prompt_id: @prompt.id).all
      answers = ""
      ans.each do |answer|
        answers += answer.answer_text + ","
      end
     
      answers = answers.split(",") #split up input with a space between words
      @frequencies = Hash.new(0) #create a new empy hash
      answers.each { |word| @frequencies[word.downcase] += 1 } #creates an array, each word and the frequency (+1 because default starts at 0)
      @frequencies = @frequencies.sort_by {|a, b| b } #sort frequencies by word count into new sub array
      @words = @frequencies.reverse! #reverse array showing word count
      @word_list = ""
      @words.each do |w|
        @word_list += "{text: \"#{w[0]}\", weight: #{w[1]*3}},"
      end
      @word_list += "{}"
    end
    
    def bar_chart
      @prompt = Prompt.find(params[:id].to_i)
      @choices = Choice.where(prompt_id: @prompt.id).all
      @answers = Answer.where(prompt_id: @prompt.id).all
      @chart_data = Hash.new
      @choices.each do |choice|
        @chart_data[choice.choice_text] = Answer.where(choice_id: choice.id).count
      end
      @winning_answer = largest_hash_key(@chart_data)
    end
    
    def says_who
      @prompt = Prompt.find(params[:id].to_i)
      @choices = Choice.where(prompt_id: @prompt.id).all
      @answers = Answer.where(prompt_id: @prompt.id).all      
      if @prompt.prompt_type == "geo"
        @chart_data = Answer.where(prompt_id: @prompt.id).group('country').count
        if @chart_data.length == 1 and @chart_data.keys.first == "United States"
          @states_only = true
          @chart_data = Answer.where(prompt_id: @prompt.id).group('administrative_area_level_1').count
        else 
          @states_only = false
        end
      else
        @chart_data = Hash.new
        @choices.each do |choice|
          @chart_data[choice.choice_text] = Answer.where(choice_id: choice.id).count
        end
      end
      @winning_answer = largest_hash_key(@chart_data)
    end
    
    def geo_results
      @prompt = Prompt.find(params[:id].to_i)
      @answers = Answer.where(prompt_id: @prompt.id).group('country_short').count.sort
      
      @winning_answer = largest_hash_key(@answers)
    end

private
  def largest_hash_key(hash)
    hash.max_by{ |k,v| v }[0]
  end

end