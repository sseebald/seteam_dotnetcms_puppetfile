class demo_offline_windows_dotnetcms (
  $srv_root = '/var/seteam-files',
) {

  $dir_root   = "${srv_root}/demo_offline_windows_dotnetcms"

  Staging::File {
    require => File[$dir_root],
  }

  file { $directories:
    ensure => directory,
    mode   => '0755',
  }

  staging::file { "7z920-x64.msi":
    source => "https://s3.amazonaws.com/saleseng/files/7zip/7z920-x64.msi",
    target => "${dir_root}",
  }

  staging::file { "CMS4.06.zip":
    source => "https://s3.amazonaws.com/saleseng/files/dotnetcms/CMS4.06.zip",
    target => "${dir_root}",
  }

  staging::file { "dotNetFx40_Full_x86_x64.exe":
    source => "https://s3.amazonaws.com/saleseng/files/dotnetcms/dotNetFx40_Full_x86_x64.exe",
    target => "${dir_root}",
  }

 }

include demo_offline_windows_dotnetcms
