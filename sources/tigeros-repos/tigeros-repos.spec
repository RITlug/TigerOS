Summary:        TigerOS package repositories
Name:           tigeros-repos
Version:        26
Release:        1
License:        MIT
Group:          System Environment/Base
URL:            https://github.com/RITlug/TigerOS
Source:         %{name}-%{version}.tar.gz
Provides:       tigeros-repos(%{version})
Requires:       system-release(%{version})
BuildArch:      noarch

%description
TigerOS package repository files for yum and dnf along with gpg public keys


%prep
%setup -q

%build

%install
# Install the keys
install -d -m 755 $RPM_BUILD_ROOT/etc/pki/rpm-gpg
install -m 644 RPM-GPG-KEY* $RPM_BUILD_ROOT/etc/pki/rpm-gpg/

# and add symlink for compat generic location
ln -s RPM-GPG-KEY-TigerOS-%{version}-primary RPM-GPG-KEY-%{version}-TigerOS

install -d -m 755 $RPM_BUILD_ROOT/etc/yum.repos.d
for file in tigeros*repo ; do
  install -m 644 $file $RPM_BUILD_ROOT/etc/yum.repos.d
done


%files
%defattr(-,root,root,-)
%dir /etc/yum.repos.d
%config(noreplace) /etc/yum.repos.d/tigeros.repo
%dir /etc/pki/rpm-gpg
/etc/pki/rpm-gpg/*


%changelog
