use Mix.Releases.Config,
  default_release: :default,
  default_environment: :default

environment :default do
  set(dev_mode: false)
  set(include_erts: true)
  set(include_src: false)

  set(
    overlays: [
      {:template, "rel/templates/vm.args.eex", "releases/<%= release_version %>/vm.args"}
    ]
  )
end

release :ael_api do
  set(version: current_version(:ael_api))

  set(
    applications: [
      ael_api: :permanent
    ]
  )

  set(config_providers: [ConfexConfigProvider])
end

release :ael_ceph_api do
  set(version: current_version(:ael_api))

  set(
    applications: [
      ael_api: :permanent
    ]
  )

  set(config_providers: [ConfexConfigProvider])
end
