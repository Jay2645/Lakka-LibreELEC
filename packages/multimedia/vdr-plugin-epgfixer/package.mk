################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vdr-plugin-epgfixer"
PKG_VERSION="1ad4aaf"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-epgfixer"
#PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_URL="http://projects.vdr-developer.org/git/vdr-plugin-epgfixer.git/snapshot/vdr-plugin-epgfixer-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr pcre"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr-plugin-epgfixer"
PKG_LONGDESC="Plugin for modifying EPG data using regular expressions."

PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  export LDFLAGS="$LDFLAGS -fPIC"
}

make_target() {
  VDR_DIR=$(get_build_dir vdr)
  make VDRDIR=$VDR_DIR \
    LIBDIR="." \
    LOCALEDIR="./locale"
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
