class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, '').length

    @word_count = @text.split.size

    @occurrences = @text.scan(@special_word).size



    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = (@principal * (@apr/100/12)) / (1 - (1 + (@apr/100/12)) ** (-12 * @years))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = (@starting - @ending).round(2)
    @minutes = ((@starting - @ending) / 60).round(2)
    @hours = ((@starting - @ending) / 3600).round(2)
    @days = ((@starting - @ending) / 86400).round(2)
    @weeks = ((@starting - @ending) / 604800).round(2)
    @years = ((@starting - @ending) / 220752000).round(2)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    @median = (@numbers.sort[((@numbers.sort.length - 1)/2).floor] +
    @numbers.sort[((@numbers.sort.length - 1)/2).ceil])/2

    @sum = @numbers.inject(0){|sum,x| sum + x}

    @mean = (@sum / @count)

    @variance = @numbers.inject(0.0) {|s,x| s + (x - @mean)**2}

    @standard_deviation = @variance**(2**-1)

    @mode =


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
