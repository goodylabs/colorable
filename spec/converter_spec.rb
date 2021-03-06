require_relative 'spec_helper'

include Colorable::Converter
describe Colorable::Converter do
  let(:conv) { Colorable::Converter }
  describe "#name2rgb" do
    it "return a RGB value" do
      name2rgb("Alice Blue").should eql [240, 248, 255]
      name2rgb("Khaki").should eql [240, 230, 140]
      name2rgb("Mint Cream").should eql [245, 255, 250]
      name2rgb("Thistle").should eql [216, 191, 216]
      name2rgb("Hello Yellow").should be_nil
    end
  end

  describe "#rgb2name" do
    it "returns a name" do
      rgb2name([240, 248, 255]).should eql "Alice Blue"
      rgb2name([216, 191, 216]).should eql "Thistle"
      rgb2name([0, 260, 0]).should be_nil
      rgb2name([240, 240, 240]).should be_nil
    end
  end
  
  describe "#rgb2hsb" do
    context "when a valid rgb" do
      it "returns a HSB value" do
        rgb2hsb([240, 248, 255]).should eql [208, 6, 100]
        rgb2hsb([216, 191, 216]).should eql [300, 12, 85]
        rgb2hsb([240, 230, 140]).should eql [55, 42, 94]
      end
    end

    context "when a invalid rgb" do
      it "not raise ArgumentError" do
        expect { rgb2hsb([100, 100, -10]) }.not_to raise_error ArgumentError
      end
    end
  end

  describe "#hsb2rgb" do
    context "when a valid hsb" do
      it "returns a RGB value" do
        hsb2rgb([208, 6, 100]).should eql [240, 248, 255]
        hsb2rgb([300, 12, 85]).should eql [217, 191, 217] # hava a margin of error
        hsb2rgb([55, 42, 94]).should eql [240, 231, 139]  # hava a margin of error
      end
    end

    context "when a invalid hsb" do
      it "not raise ArgumentError" do
        expect { hsb2rgb([-100, 50, 50]) }.not_to raise_error ArgumentError
        expect { hsb2rgb([350, 101, 50]) }.not_to raise_error ArgumentError
        expect { hsb2rgb([0, 50, -50]) }.not_to raise_error ArgumentError
      end
    end
  end

  describe "#rgb2hex" do
    context "when a valid rgb" do
      it "returns a HEX value" do
        rgb2hex([240, 248, 255]).should eql '#F0F8FF'
        rgb2hex([216, 191, 216]).should eql '#D8BFD8'
        rgb2hex([240, 230, 140]).should eql '#F0E68C'
      end
    end

    context "when a invalid rgb" do
      it "not raise ArgumentError" do
        expect { rgb2hex([100, 100, -10]) }.not_to raise_error ArgumentError
      end
    end
  end

  describe "#hex2rgb" do
    context "when a valid hex" do
      it "returns a RGB value" do
        hex2rgb('#F0F8FF').should eql [240, 248, 255]
        hex2rgb('#D8BFD8').should eql [216, 191, 216]
        hex2rgb('#f0e68c').should eql [240, 230, 140]
      end
    end

    context "when a invalid hex" do
      it "not raise ArgumentError" do
        expect { hex2rgb('#FFFFFG') }.not_to raise_error ArgumentError
        expect { hex2rgb('$FFFFFG') }.not_to raise_error ArgumentError
      end
    end
  end

  describe "#rgb2hsl" do
    context "when a valid rgb" do
      it "returns a HSL value" do
        expect { rgb2hsl([240, 248, 255]) }.to raise_error NotImplemented
        # rgb2hsl([240, 248, 255]).should eql [208, 100, 97]
        # rgb2hsl([216, 191, 216]).should eql [300, 24, 80]
        # rgb2hsl([240, 230, 140]).should eql [55, 77, 75]
      end
    end

    context "when a invalid rgb" do
      it "not raise ArgumentError" do
        expect { rgb2hsb([100, 100, -10]) }.not_to raise_error ArgumentError
      end
    end
  end
end
