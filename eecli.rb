require 'formula'

class Eecli < Formula
  homepage 'https://github.com/rsanchez/eecli'
  url 'https://github.com/rsanchez/eecli/releases/download/1.0.9/eecli.phar'
  sha1 'ebf7f382376996e060aa6d32e1fd50618705968b'
  version '1.0.9'

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