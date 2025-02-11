# $NetBSD: Makefile,v 1.15 2025/02/11 03:03:48 schmonz Exp $

DISTNAME=		asdf-0.16.2
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GITHUB:=asdf-vm/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://asdf-vm.com/
COMMENT=		Manage each of your project runtimes with a single tool
LICENSE=		mit

DEPENDS+=		git-base-[0-9]*:../../devel/git-base

USE_LANGUAGES=		c

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
