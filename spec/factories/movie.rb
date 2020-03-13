FactoryBot.define do
  factory :movie do
    factory :batman_one do
      title        { 'Batman Begins' }
      release_year { 2006 }
    end

    factory :batman_two do
      title        { 'Batman the dark knight' }
      release_year { 2008 }
    end

    factory :batman_three do
      title        { 'Batman the dark knight rises' }
      release_year { 2010 }
    end

  end
end