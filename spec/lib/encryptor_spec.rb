require 'spec_helper'

describe AttrEncryptedPgcrypto::Encryptor do
  use_postgres

  subject { AttrEncryptedPgcrypto::Encryptor }
  let(:plaintext) { "Hello, World!" }
  let(:cipher) { ::ActiveRecord::Base.connection.unescape_bytea "\\xc30d040703020ad1f6cd672f908b71d23e018c5798fd2ff99a15a60df661048ecf0724a5e10075150d49b8e69b727ed8d155c6c3aefcde1c8bdf584c3293ca37803c1b892cce57d70b0c1580bb2eb4" }
  
  let(:key) { "What do you want? I'm a test key!" }
  describe "#encrypt" do
    context "without key" do
      it do
        expect { subject.encrypt "plaintext" }.to raise_exception(ArgumentError)
      end
    end

    context "valid" do
      it "returns cipher text" do
        AttrEncryptedPgcrypto::Encryptor.encrypt(plaintext, key: key).should be_a(String)
      end
    end
  end

  describe "#decrypt" do
    context "valid" do
      it "returns plaintext" do
        AttrEncryptedPgcrypto::Encryptor.decrypt(cipher, key: key).should == plaintext
      end
    end

    context "invalid" do
      let(:key) { "This is not the key you're looking for." }
      specify do
        expect { AttrEncryptedPgcrypto::Encryptor.decrypt(cipher, key: key) }.to raise_exception(ActiveRecord::StatementInvalid)
      end
    end
  end
  
  describe "#encrypt - decrypt" do
    context "valid" do
      it "returns plaintext" do
        AttrEncryptedPgcrypto::Encryptor.decrypt(AttrEncryptedPgcrypto::Encryptor.encrypt(plaintext, key: key), key: key).should == plaintext
      end
    end
  end
end
