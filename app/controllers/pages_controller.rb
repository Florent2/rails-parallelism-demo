class PagesController < ApplicationController
  before_filter { @duration_in_seconds = (params[:duration].presence || 1).to_i }

  def io_bound
    sleep @duration_in_seconds
    render text: "io-bound, processed in about #{@duration_in_seconds} seconds"
  end

  def cpu_bound
    time_to_wait_until = Time.now + @duration_in_seconds
    while Time.now < time_to_wait_until
    end
    render text: "cpu-bound, processed in about #{@duration_in_seconds} seconds"
  end

end
