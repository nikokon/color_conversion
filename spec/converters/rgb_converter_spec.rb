require 'spec_helper'

describe RgbConverter do 
  describe ".matches?" do 
    it "should match args with rgb hash" do 
      expect(RgbConverter.matches?(r: 51, g: 102, b: 204)).to be_true
    end

    it "should match args with rgba hash" do 
      expect(RgbConverter.matches?(r: 51, g: 102, b: 204, a: 0.5)).to be_true
    end

    it "should not match args without rgb hash" do 
      expect(RgbConverter.matches?(h: 225, s: 73, l: 57)).to be_false
    end
    
    it "should not match a string" do 
      expect(RgbConverter.matches?("#ffffff")).to be_false
    end
  end
end