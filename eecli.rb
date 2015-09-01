require 'formula'

class Eecli < Formula
  homepage 'https://github.com/rsanchez/eecli'
  url 'https://github.com/rsanchez/eecli/releases/download/1.0.7/eecli.phar'
  sha1 '2e4047be33ee3b576497a7b2e27fb224b98e6f77'
  version '1.0.7'

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