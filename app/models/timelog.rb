class Timelog < ApplicationRecord
  belongs_to :user
  
  enum time: { １０: 0, ３０: 1, ６０: 2, ９０: 3 }
  enum effect: { A: 0, B: 1, C: 2 }
end
