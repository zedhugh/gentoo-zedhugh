# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="EPC (RPC stack for Emacs Lisp) for Python"
HOMEPAGE="
	https://github.com/tkf/python-epc
	https://pypi.org/project/epc
"
SRC_URI="
	https://github.com/tkf/python-epc/archive/v${PV}.tar.gz
		-> ${P}.tar.gz
"
S=${WORKDIR}/python-epc-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/sexpdata-0.0.3"

distutils_enable_tests pytest
