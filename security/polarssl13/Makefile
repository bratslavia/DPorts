# $FreeBSD$

PORTNAME=	polarssl
PORTVERSION=	1.3.11
DISTVERSIONSUFFIX=	-gpl
CATEGORIES=	security devel
MASTER_SITES=	https://polarssl.org/download/
PKGNAMESUFFIX=	13
DISTNAME=	mbedtls-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	SSL/TLS and cryptography library

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_sparc64=	fails to compile: relocation error

ALL_TARGET=	no_test
MAKE_ENV=	SHARED=1
USES=		cpe gmake tar:tgz
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/mbedtls-${PORTVERSION}

CONFLICTS=	polarssl-[0-9]*

post-patch:
	@${REINPLACE_CMD} \
		-e 's/PREFIX/NAMEPREFIX/' \
		-e 's/$$(DESTDIR)/&$$(PREFIX)/' \
		${WRKSRC}/Makefile

post-install:
	${FIND} ${STAGEDIR}${PREFIX}/bin ${STAGEDIR}${PREFIX}/lib -type f | \
		${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
