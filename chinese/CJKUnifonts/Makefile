# Created by: Shen Chuan-Hsing <statue@freebsd.sinica.edu.tw>
# $FreeBSD$

PORTNAME=	CJKUnifonts
PORTVERSION=	0.2.20080216.1
PORTREVISION=	1
CATEGORIES=	chinese x11-fonts
MASTER_SITES=	LOCAL/chinsan/fonts/:uming \
		http://ftp.debian.org/debian/pool/main/t/ttf-arphic-uming/:uming \
		LOCAL/chinsan/fonts/:ukai \
		http://ftp.debian.org/debian/pool/main/t/ttf-arphic-ukai/:ukai
DISTFILES=	ttf-arphic-uming_${PORTVERSION}.orig.tar.gz:uming \
		ttf-arphic-ukai_${PORTVERSION}.orig.tar.gz:ukai

MAINTAINER=	ports@FreeBSD.org
COMMENT=	CJKUnifonts TrueType Font is a combine of Arphic Ming and Kai fonts

DIST_SUBDIR=	${PORTNAME}
NO_WRKSUBDIR=	yes
NO_BUILD=	yes

TTF=		ukai.ttc uming.ttc

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKDIR}/ukai.ttc ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKDIR}/uming.ttc ${STAGEDIR}${FONTSDIR}

.include "${.CURDIR}/../ttfm/Makefile.ttf"
.include <bsd.port.mk>
