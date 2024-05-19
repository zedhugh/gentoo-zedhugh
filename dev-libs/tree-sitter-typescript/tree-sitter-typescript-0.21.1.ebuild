# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit tree-sitter-grammar

DESCRIPTION="TypeScript grammar for Tree-sitter"
HOMEPAGE="https://github.com/tree-sitter/tree-sitter-typescript"
LICENSE="MIT"
SLOT="0"

TSX_PN="tree-sitter-tsx"
TSX_S="/../../tsx/src"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/tree-sitter/tree-sitter-typescript"
	EGIT_BRANCH="master"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}-${PV}"
	SRC_URI=""
else
	KEYWORDS="~amd64"
fi

S="${WORKDIR}"/${PN}-${PV}/typescript/src

IUSE+=" tsx"

src_compile() {
	cd "$S"
	tree-sitter-grammar_src_compile

	if use tsx; then
		local TEMP_PN="${PN}"
		local TEMP_S="${S}"
		S="${S}${TSX_S}"
		cd "$S"
		PN="$TSX_PN"
		tree-sitter-grammar_src_compile

		PN="${TEMP_PN}"
		S="${TEMP_S}"
	fi
}

src_test() {
	cd "$S"
	tree-sitter-grammar_src_test

	if use tsx; then
		local TEMP_PN="${PN}"
		local TEMP_S="${S}"
		S="${S}${TSX_S}"
		cd "$S"
		PN="$TSX_PN"
		tree-sitter-grammar_src_test
		PN="${TEMP_PN}"
		S="${TEMP_S}"
	fi
}

src_install() {
	cd "$S"
	tree-sitter-grammar_src_install

	if use tsx; then
		local TEMP_PN="${PN}"
		local TEMP_S="${S}"
		S="${S}${TSX_S}"
		cd "$S"
		PN="$TSX_PN"
		tree-sitter-grammar_src_install
		PN="${TEMP_PN}"
		S="${TEMP_S}"
	fi
}
