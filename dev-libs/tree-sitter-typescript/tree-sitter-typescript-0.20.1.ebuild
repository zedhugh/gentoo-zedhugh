# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit tree-sitter-grammar

DESCRIPTION="TypeScript grammar for Tree-sitter"
HOMEPAGE="https://github.com/tree-sitter/tree-sitter-typescript"
S="${WORKDIR}"/${PN}-${PV}/typescript/src

IUSE+=" tsx"

TSX_PN="tree-sitter-tsx"

src_compile() {
	S="${WORKDIR}"/${PN}-${PV}/typescript/src
	cd "$S"
	tree-sitter-grammar_src_compile

	if use tsx; then
		local TEMP_PN="${PN}"
		S="${WORKDIR}"/${PN}-${PV}/tsx/src
		cd "$S"
		PN="tree-sitter-tsx"
		tree-sitter-grammar_src_compile
		PN="${TEMP_PN}"
	fi
}

src_test() {
	S="${WORKDIR}"/${PN}-${PV}/typescript/src
	cd "$S"
	tree-sitter-grammar_src_test

	if use tsx; then
		local TEMP_PN="${PN}"
		S="${WORKDIR}"/${PN}-${PV}/tsx/src
		cd "$S"
		PN="tree-sitter-tsx"
		tree-sitter-grammar_src_test
		PN="${TEMP_PN}"
	fi
}

src_install() {
	S="${WORKDIR}"/${PN}-${PV}/typescript/src
	cd "$S"
	tree-sitter-grammar_src_install

	if use tsx; then
		local TEMP_PN="${PN}"
		S="${WORKDIR}"/${PN}-${PV}/tsx/src
		cd "$S"
		PN="tree-sitter-tsx"
		tree-sitter-grammar_src_install
		PN="${TEMP_PN}"
	fi
}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
