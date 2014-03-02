module SearchHelper
  def times_for_select
    %w[Now] + ((4..22).to_a + (4..22).to_a).sort.each_with_index.map do |t, i|
      in_format(cycle_hour_and_minutes(t, i).to_time)
    end
  end

  def cycle_hour_and_minutes(t, i)
    "#{pad_hour(t)}:#{i % 2 == 0 ? '00' : '30'}:00"
  end

  def pad_hour(t)
    "#{'0' if t < 10}#{t}"
  end
end