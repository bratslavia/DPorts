# $FreeBSD$

PORTNAME=	gstreamer
PORTVERSION=	2.2.5
PORTREVISION=	1
CATEGORIES=	multimedia rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Ruby/GStreamer is a Ruby binding for GStreamer

LICENSE=	LGPL21 LGPL3
LICENSE_COMB=	dual

LIB_DEPENDS=	libgstreamer-1.0.so:${PORTSDIR}/multimedia/gstreamer1
RUN_DEPENDS=	rubygem-glib2>=${PORTVERSION}:${PORTSDIR}/devel/rubygem-glib2 \
		rubygem-gobject-introspection>=${PORTVERSION}:${PORTSDIR}/devel/rubygem-gobject-introspection

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

post-patch:
	@${REINPLACE_CMD} -e '1s|/usr/bin/evn|/usr/bin/env|' \
		${WRKSRC}/sample/gst-inspect.rb

.include <bsd.port.mk>
