dep 'postgres' do
  
  requires 'set.locale'
  requires_when_unmet {
     on :apt, 'ppa'.with('ppa:pitti/postgresql')
  }
   
  met? {
    ('/var/lib/postgresql/9.1' / 'main').dir?
  }
  
  requires_when_unmet {
    on :apt, 'ppa'.with('ppa:pitti/postgresql')
  }
  meet {
    shell "apt-get install -y --force-yes postgresql-9.1 libpq-dev", :sudo => true
  }
end