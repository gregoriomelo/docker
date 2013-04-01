name             'docker'
provides        'docker'
maintainer       'Gregório Melo'
maintainer_email 'https://github.com/gregoriomelo'
license          'All rights reserved'
description      'Installs docker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'docker', 'Installs Docker'

support 'ubuntu'
