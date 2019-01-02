class CalcController < ApplicationController
  def input
    render layout: false
  end

  def view
    v1 = params[:v1]
    @result = root(v1)

    respond_to do |format|
      format.html
      format.json do
        render json:
                   {type: @result.class.to_s, value: @result}
      end
    end
  end
end

def float?(str)
  true if Float(str) rescue false
end

def root(num)
  if float?(num) && num.to_f.positive?
    prev = rand(1..num.to_i).to_f
    curr = (prev + num.to_f / prev) / 2.0
    arr = [].push(curr)
    loop do
      arr.push(curr = (curr + num.to_f / curr) / 2.0)
      break if ((curr**2 - num.to_f) / num.to_f) < 1e-3
    end
  else
    arr = 'error'
  end
  arr = 0 if num == '0'
  arr
end
