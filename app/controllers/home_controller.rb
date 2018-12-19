# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate

  # show top crytp currencies
  def show
    @currencies = CryptocurrenciesService.new.get_top
  end
end
