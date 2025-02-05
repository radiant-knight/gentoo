# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10} )

inherit distutils-r1

DESCRIPTION="Python scripts to manipulate trash cans via the command line"
HOMEPAGE="https://github.com/andreafrancia/trash-cli"
SRC_URI="https://github.com/andreafrancia/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)"

RDEPEND="
	dev-python/psutil[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_test() {
	local -x COLUMNS=80
	distutils-r1_src_test
}
