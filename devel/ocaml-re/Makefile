# Created by: Veniamin Gvozdikov <vg@FreeBSD.org>
# $FreeBSD$

PORTNAME=	re
PORTVERSION=	1.4.1
CATEGORIES=	devel
PKGNAMEPREFIX=	ocaml-

MAINTAINER=	vg@FreeBSD.org
COMMENT=	Pure OCaml regular expressions

LICENSE=	LGPL21

USES=	gmake
HAS_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	ocaml
GH_PROJECT=	${PKGNAMEPREFIX}${PORTNAME}
GH_TAGNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

USE_OCAML=		yes
USE_OCAML_FINDLIB=	yes
USE_OCAMLFIND_PLIST=	yes

CONFIGURE_ARGS=		--destdir "${DESTDIRNAME}"

do-configure:
	cd ${WRKSRC} && ocaml setup.ml -configure ${CONFIGURE_ARGS}

.include <bsd.port.mk>
