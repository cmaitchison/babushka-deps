dep 'postgres.managed', :version do
  version.default('9.1')
  # Assume the installed version if there is one
  version.default!(shell('psql --version').val_for('psql (PostgreSQL)')[/^\d\.\d/]) if which('psql')
  requires 'set.locale'
  requires_when_unmet {
    on :apt, 'ppa'.with('ppa:pitti/postgresql')
  }
  installs {
    via :apt, ["postgresql-#{owner.version}", "libpq-dev"]
    via :brew, "postgresql"
  }
  provides "psql ~> #{version}.0"
end