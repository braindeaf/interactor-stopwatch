# frozen_string_literal: true

RSpec.describe Interactor::Stopwatch do
  it "has a version number" do
    expect(Interactor::Stopwatch::VERSION).not_to be nil
  end

  let(:klass) do
    Class.new do
      include Interactor
      include Interactor::Stopwatch

      stopwatch do |duration|
        context.duration = duration
      end

      def call
        sleep 0.1
        context.message = 'I measured how long this took'
      end
    end
  end

  it "calls interactor" do
    context = klass.call
    expect(context).to be_success 
    expect(context.message).to eq('I measured how long this took')
  end

  it "evaluates stopwatch block" do
    context = klass.call
    expect(context).to be_success 
    expect(context.duration).to be_an(ActiveSupport::Duration) 
    expect(context.duration).to be >= 0.1.seconds  
  end
end
