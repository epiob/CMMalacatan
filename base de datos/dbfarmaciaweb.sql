-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2018 a las 00:26:12
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dbfarmaciaweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE IF NOT EXISTS `carrito` (
  `idproducto` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `presentacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL,
  `session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritoc`
--

CREATE TABLE IF NOT EXISTS `carritoc` (
  `idproducto` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `presentacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL,
  `session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
`idcategoria` int(11) NOT NULL,
  `forma_farmaceutica` varchar(255) NOT NULL,
  `ff_simplificada` varchar(255) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
`idcliente` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `documento` char(8) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombres`, `documento`, `direccion`, `telefono`, `email`, `idsucu_c`) VALUES
(1, 'publico en general', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
`idcompra` int(11) NOT NULL,
  `idlab_pro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `docu` varchar(30) NOT NULL,
  `num_docu` char(50) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `idconfi` int(11) NOT NULL,
  `logo` varchar(255) CHARACTER SET latin1 NOT NULL,
  `empresa` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `moneda` varchar(255) CHARACTER SET latin1 NOT NULL,
  `imp_num` varchar(30) CHARACTER SET latin1 NOT NULL,
  `imp_letra` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`idconfi`, `logo`, `empresa`, `moneda`, `imp_num`, `imp_letra`) VALUES
(1, '1529795608-1529794632-1529794456-1529186822-logo.png', 'SISFARMA. S.AC', 'S/.', '18', 'IGV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE IF NOT EXISTS `detallecompra` (
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE IF NOT EXISTS `detalleventa` (
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio_proveedor`
--

CREATE TABLE IF NOT EXISTS `laboratorio_proveedor` (
`idlab_pro` int(11) NOT NULL,
  `laboratorio` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ruc` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE IF NOT EXISTS `lote` (
`idlote` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE IF NOT EXISTS `presentacion` (
`idpresentacion` int(11) NOT NULL,
  `presentacion` varchar(255) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
`idproducto` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `idlote` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `stockminimo` int(11) NOT NULL,
  `precio_compra` decimal(18,2) NOT NULL,
  `precio_venta` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `ventasujeta` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `reg_sanitario` varchar(255) DEFAULT NULL,
  `idcategoria` int(11) NOT NULL,
  `idpresentacion` int(11) NOT NULL,
  `idlab_pro` int(11) NOT NULL,
  `idsintoma` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_similar`
--

CREATE TABLE IF NOT EXISTS `producto_similar` (
`idp_similar` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `presentacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sintoma`
--

CREATE TABLE IF NOT EXISTS `sintoma` (
`idsintoma` int(11) NOT NULL,
  `sintoma` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE IF NOT EXISTS `sucursal` (
`idsucursal` int(11) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `ruc_letra` varchar(30) NOT NULL,
  `ruc_num` char(30) NOT NULL,
  `representante` varchar(255) DEFAULT NULL,
  `serie` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idsucursal`, `razon_social`, `direccion`, `telefono`, `ruc_letra`, `ruc_num`, `representante`, `serie`) VALUES
(1, 'Sisfarma Central Lima S.A.C', 'Lima', '111-1111', 'R.U.C', '11111111111', '', '001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_usuario`
--

CREATE TABLE IF NOT EXISTS `sucursal_usuario` (
`idsucu_usu` int(11) NOT NULL,
  `idsucu` int(11) NOT NULL,
  `idusuu` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_usuario`
--

INSERT INTO `sucursal_usuario` (`idsucu_usu`, `idsucu`, `idusuu`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`idusu` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `cargo_usu` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fechaingreso` date NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `estado` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusu`, `usuario`, `clave`, `cargo_usu`, `nombres`, `email`, `telefono`, `fechaingreso`, `tipo`, `estado`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrador', 'jose perez', 'jose@gmail.com', '123-3434', '2017-09-05', 'ADMINISTRADOR', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`idventa` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `igv` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `efectivo` decimal(18,2) DEFAULT NULL,
  `vuelto` decimal(18,2) DEFAULT NULL,
  `tipo_docu` varchar(30) NOT NULL,
  `num_docu` varchar(255) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`idcompra`), ADD KEY `FK_compra_proveedor_idprovedor` (`idlab_pro`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
 ADD PRIMARY KEY (`idconfi`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
 ADD KEY `FK_detallecompra_productos_idproducto` (`idproducto`), ADD KEY `FK_detallecompra_compra_idcompra` (`idcompra`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
 ADD KEY `FK_detalleventa_productos_idproducto` (`idproducto`), ADD KEY `FK_detalleventa_venta_idventa` (`idventa`);

--
-- Indices de la tabla `laboratorio_proveedor`
--
ALTER TABLE `laboratorio_proveedor`
 ADD PRIMARY KEY (`idlab_pro`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
 ADD PRIMARY KEY (`idlote`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
 ADD PRIMARY KEY (`idpresentacion`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`idproducto`), ADD KEY `FK_productos_presentacion_idpresentacion` (`idpresentacion`), ADD KEY `FK_productos_categoria_idcategoria` (`idcategoria`), ADD KEY `FK_productos_laboratorio_idlab` (`idlab_pro`), ADD KEY `FK_productos_sintoma_idsintoma` (`idsintoma`), ADD KEY `FK_productos_lote_idlote` (`idlote`);

--
-- Indices de la tabla `producto_similar`
--
ALTER TABLE `producto_similar`
 ADD PRIMARY KEY (`idp_similar`), ADD KEY `FK_producto_similar_productos_idproducto` (`idproducto`);

--
-- Indices de la tabla `sintoma`
--
ALTER TABLE `sintoma`
 ADD PRIMARY KEY (`idsintoma`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
 ADD PRIMARY KEY (`idsucursal`), ADD UNIQUE KEY `direccion` (`direccion`);

--
-- Indices de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
 ADD PRIMARY KEY (`idsucu_usu`), ADD KEY `FK_sucursal_usuario_usuario_idusu` (`idusuu`), ADD KEY `FK_sucursal_usuario_sucursal_idsucursal` (`idsucu`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`idusu`), ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`idventa`), ADD KEY `FK_venta_usuario_idusu` (`idusuario`), ADD KEY `FK_venta_cliente_idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `laboratorio_proveedor`
--
ALTER TABLE `laboratorio_proveedor`
MODIFY `idlab_pro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
MODIFY `idlote` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
MODIFY `idpresentacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto_similar`
--
ALTER TABLE `producto_similar`
MODIFY `idp_similar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sintoma`
--
ALTER TABLE `sintoma`
MODIFY `idsintoma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
MODIFY `idsucursal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
MODIFY `idsucu_usu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `idusu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
ADD CONSTRAINT `FK_compra_laboratorio_proveedor_idlab_pro` FOREIGN KEY (`idlab_pro`) REFERENCES `laboratorio_proveedor` (`idlab_pro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
ADD CONSTRAINT `FK_detallecompra_compra_idcompra` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`),
ADD CONSTRAINT `FK_detallecompra_productos_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
ADD CONSTRAINT `FK_detalleventa_productos_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`),
ADD CONSTRAINT `FK_detalleventa_venta_idventa` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
ADD CONSTRAINT `FK_productos_categoria_idcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_productos_laboratorio_proveedor_idlab_pro` FOREIGN KEY (`idlab_pro`) REFERENCES `laboratorio_proveedor` (`idlab_pro`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_productos_lote_idlote` FOREIGN KEY (`idlote`) REFERENCES `lote` (`idlote`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_productos_presentacion_idpresentacion` FOREIGN KEY (`idpresentacion`) REFERENCES `presentacion` (`idpresentacion`),
ADD CONSTRAINT `FK_productos_sintoma_idsintoma` FOREIGN KEY (`idsintoma`) REFERENCES `sintoma` (`idsintoma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_similar`
--
ALTER TABLE `producto_similar`
ADD CONSTRAINT `FK_producto_similar_productos_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
ADD CONSTRAINT `FK_sucursal_usuario_sucursal_idsucursal` FOREIGN KEY (`idsucu`) REFERENCES `sucursal` (`idsucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_sucursal_usuario_usuario_idusu` FOREIGN KEY (`idusuu`) REFERENCES `usuario` (`idusu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
ADD CONSTRAINT `FK_venta_cliente_idcliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `FK_venta_usuario_idusu` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
