# Created by: Alexander Zhuravlev <zaa@zaa.pp.ru>
# $FreeBSD$

PORTNAME=	Net-eBay
PORTVERSION=	0.61
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Perl Interface to XML based eBay API

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Crypt-SSLeay>=0:${PORTSDIR}/security/p5-Crypt-SSLeay \
		p5-DateTime-Precise>=0:${PORTSDIR}/devel/p5-DateTime-Precise \
		p5-HTML-Format>=0:${PORTSDIR}/textproc/p5-HTML-Format \
		p5-HTML-PrettyPrinter>=0:${PORTSDIR}/www/p5-HTML-PrettyPrinter \
		p5-HTML-Tree>=0:${PORTSDIR}/www/p5-HTML-Tree \
		p5-HTTP-Date>=0:${PORTSDIR}/www/p5-HTTP-Date \
		p5-HTTP-Message>=0:${PORTSDIR}/www/p5-HTTP-Message \
		p5-Text-Format>=0:${PORTSDIR}/textproc/p5-Text-Format \
		p5-XML-Dumper>=0:${PORTSDIR}/textproc/p5-XML-Dumper \
		p5-XML-Simple>=0:${PORTSDIR}/textproc/p5-XML-Simple \
		p5-libwww>=0:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	EXAMPLES

USE_PERL5=	configure
USES=		perl5

PORTEXAMPLES=	*

post-patch:
	@${MKDIR} ${WRKSRC}/examples/
	@${MV} ${WRKSRC}/*.pl ${WRKSRC}/examples/
	@${REINPLACE_CMD} -e '1 s|/usr/bin/perl|${PERL}|' ${WRKSRC}/examples/*.pl

post-install:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${STAGEDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
