class TimeOfDay
  include KmapsEngine::PassiveRecord
  
  attr_accessor :tibetan_name, :gregorian_name
  
  create tibetan_name: 'nam langs', gregorian_name: 'dawn'
  create tibetan_name: 'nyi shar', gregorian_name:  'sunrise'
  create tibetan_name: 'nyi dros or snga dro', gregorian_name: 'morning'
  create tibetan_name: 'nyi phyed', gregorian_name: 'noon'
  create tibetan_name: 'phye yod or phyi dro', gregorian_name: 'afternoon'
  create tibetan_name: 'nyi myur', gregorian_name: 'hour before sunset'
  create tibetan_name: 'nyi nub', gregorian_name: 'sunset'
  create tibetan_name: 'sa sros', gregorian_name: 'evening twilight'
  create tibetan_name: "srod 'khor", gregorian_name: 'dusk'
  create tibetan_name: 'nam phyed', gregorian_name: 'midnight'
  create tibetan_name: 'phyed yol', gregorian_name: 'after midnight hours'
  create tibetan_name: 'tho rangs', gregorian_name: 'morning twilight'
  create tibetan_name: 'nyin mo', gregorian_name: 'day time (general)'
  create tibetan_name: 'dgong mo', gregorian_name: 'evening (general)'
  create tibetan_name: 'mtshan mo', gregorian_name: 'night time (general)'

  def to_s
    "#{gregorian_name} / #{tibetan_name}"
  end
end