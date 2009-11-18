module ObserverSupport
  extend self

  def all_observers
    @@all_observers ||= begin
      observer_filenames = Dir.glob File.join(RAILS_ROOT, 'app', 'observers', '*.rb')
      observer_instances = observer_filenames.map { |filename| File.basename(filename, '.rb').camelize.constantize.instance }

      observer_hash = {}
      observer_instances.each do |observer_instance|
        observer_hash[observer_instance] = observer_instance.send(:observed_classes)
      end

      observer_hash
    end
  end

  def for_each_observer_and_observed_model(*observers)
    observers = observers.flatten
    use_all_observers = observers == [:all]

    all_observers.each do |observer_instance, observed_models|
      if use_all_observers || observers.include?(observer_instance.class.to_s.underscore.to_sym)
        observed_models.each do |model|
          yield observer_instance, model
        end
      end
    end
  end

  def disable_observers(*observers)
    for_each_observer_and_observed_model(observers) do |observer, model|
      model.delete_observer(observer)
    end
  end

  def enable_observers(*observers)
    for_each_observer_and_observed_model(observers) do |observer, model|
      model.add_observer(observer)
    end
  end
end

module RspecObserverSupport
  def enable_observers(*observers)
    before(:all) do
      ObserverSupport.enable_observers(observers)
    end

    after(:all) do
      ObserverSupport.disable_observers(observers)
    end
  end
end

# By default, disable all observers.  We'll enable the specific ones we need in the tests we need them in.
ObserverSupport.disable_observers(:all)

# make the enable_observers method available to our specs...
ActiveSupport::TestCase.extend RspecObserverSupport