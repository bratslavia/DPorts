# Created by: Florian Smeets <flo@smeets.im>
# $FreeBSD$

PORTNAME=	wbxml
PORTVERSION=	1.0.3
CATEGORIES=	textproc pear
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	flo@FreeBSD.org
COMMENT=	PECL extension that provides WBXML conversion capabilities

LIB_DEPENDS=	libwbxml2.so:${PORTSDIR}/textproc/wbxml2

CONFIGURE_ARGS=	--with-wbxml=${LOCALBASE} \
		--with-libexpat-dir=${LOCALBASE}
USE_PHP=	yes
USE_PHPEXT=	yes

.include <bsd.port.mk>
