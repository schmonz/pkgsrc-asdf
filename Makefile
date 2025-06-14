# $NetBSD: Makefile,v 1.25 2025/06/07 16:37:07 schmonz Exp $

DISTNAME=		asdf-0.18.0
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GITHUB:=asdf-vm/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://asdf-vm.com/
COMMENT=		Manage each of your project runtimes with a single tool
LICENSE=		mit

DEPENDS+=		git-base-[0-9]*:../../devel/git-base

AUTO_MKDIRS=		yes

post-install:
	${INSTALL_DATA} ${WRKSRC}/internal/completions/asdf.bash \
		${DESTDIR}${PREFIX}/share/bash-completion/completions/asdf
	${INSTALL_DATA} ${WRKSRC}/internal/completions/asdf.fish \
		${DESTDIR}${PREFIX}/share/fish/vendor_completions.d/
	${INSTALL_DATA} ${WRKSRC}/internal/completions/asdf.zsh \
		${DESTDIR}${PREFIX}/share/zsh/site-functions/_asdf

.include "go-modules.mk"

.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
