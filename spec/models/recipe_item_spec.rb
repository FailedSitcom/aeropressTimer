require 'spec_helper'

describe RecipeItem do
  it { should belong_to(:recipe) }
end
