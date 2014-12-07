require 'formula'

class Eecli < Formula
  homepage 'https://github.com/rsanchez/eecli'
  url 'https://github.com/rsanchez/eecli/releases/download/0.0.1-alpha/eecli.phar'
  sha1 '6123dcad1eda73fc6e93238efa5ff62bc51b7e69'
  version '0.0.1-alpha'

  def install
    libexec.install "eecli.phar"
    sh = libexec + "eecli"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/eecli.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  test do
    system 'eecli --version'
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "eecli --version".

    You can read more about eecli by running:
      "brew home eecli".
    EOS
  end

end