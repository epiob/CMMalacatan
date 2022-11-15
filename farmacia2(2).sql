-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 19:36:44
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
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

CREATE TABLE `carritoc` (
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

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `forma_farmaceutica` varchar(255) NOT NULL,
  `ff_simplificada` varchar(255) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `forma_farmaceutica`, `ff_simplificada`, `idsucu_c`) VALUES
(1, 'Azitromicina', 'azit', 1),
(2, 'Acetaminofen 750mg', 'acet', 1),
(3, 'carboximetilcisteina', 'carbo', 1),
(4, 'dextrometorfano', 'dextro', 1),
(5, 'clorferinamina', 'clorfer', 1),
(6, 'Guyacolato de glicerilo', 'guayacolato', 1),
(7, 'Salbutamol 5mg', 'salbutamol', 1),
(8, 'trimetropim 40mg', 'trimetoprim', 1),
(9, 'bromuro de iprotopium', 'bromuro', 1),
(10, 'amoxicilina', 'amox', 1),
(11, 'vitaminas', 'vitaminas', 1),
(12, 'metoclopramida', 'metoclopramida', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `documento` varchar(13) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombres`, `documento`, `direccion`, `telefono`, `email`, `idsucu_c`) VALUES
(1, 'publico en general', '', '', '', '', 1),
(14, 'Pedro', '4568978956451', '', '', NULL, 1),
(15, 'Eduardo Pio', '2501393910920', 'Malacatan', '59796718', NULL, 1),
(17, 'Juan Lopez', '2136546873132', '', '', NULL, 1),
(18, 'Juan perez', '2131326546545', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
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

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idcompra`, `idlab_pro`, `fecha`, `subtotal`, `igv`, `total`, `docu`, `num_docu`, `idsucu_c`) VALUES
(1, 2, '2022-10-15', '0.00', '0.00', '0.00', 'FACTURA', '1', 1),
(2, 6, '2022-10-19', '0.00', '0.00', '0.00', 'FACTURA', '12', 1),
(3, 5, '2022-10-29', '0.00', '0.00', '0.00', 'BOLETA', '4568', 1),
(4, 2, '2022-10-30', '0.00', '0.00', '0.00', 'BOLETA', '45654', 1),
(5, 8, '2022-10-30', '0.00', '0.00', '0.00', 'FACTURA', '444', 1),
(6, 8, '2022-10-30', '0.00', '0.00', '0.00', 'BOLETA', 'dfdd', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
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
(1, '1529795608-1529794632-1529794456-1529186822-logo.png', 'Municipalidad Malacatan', 'Q.', '0', 'IVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `idcompra` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`idcompra`, `idproducto`, `cantidad`, `precio`, `importe`) VALUES
(1, 1, '3.00', '0.00', '0.00'),
(2, 5, '3.00', '0.00', '0.00'),
(3, 3, '1.00', '0.00', '0.00'),
(4, 5, '3.00', '0.00', '0.00'),
(5, 9, '1.00', '0.00', '0.00'),
(6, 9, '1.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `precio` decimal(18,2) NOT NULL,
  `descuento` decimal(18,2) NOT NULL,
  `importe` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idventa`, `idproducto`, `cantidad`, `precio`, `descuento`, `importe`) VALUES
(2, 7, '1.00', '0.00', '0.00', '0.00'),
(2, 11, '1.00', '0.00', '0.00', '0.00'),
(4, 8, '1.00', '0.00', '0.00', '0.00'),
(4, 6, '1.00', '0.00', '0.00', '0.00'),
(4, 4, '1.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio_proveedor`
--

CREATE TABLE `laboratorio_proveedor` (
  `idlab_pro` int(11) NOT NULL,
  `laboratorio` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ruc` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `laboratorio_proveedor`
--

INSERT INTO `laboratorio_proveedor` (`idlab_pro`, `laboratorio`, `ruc`, `direccion`, `telefono`, `email`, `idsucu_c`) VALUES
(2, 'CAPLIN POINT', '', 'GUATEMALA', '23568978', '', 1),
(3, 'LABORATORIOS ROWE', '', 'GUATEMALA', '12345678', '', 1),
(4, 'Selectpharma', '', 'Guatemala', '12345879', '', 1),
(5, 'Donovan Werke', '', 'Guatemala', '45689657', '', 1),
(6, 'Genertx', '', 'Guatemala', '25678956', '', 1),
(7, 'Bonin', '', 'Guatemala', '25648956', '', 1),
(8, 'Unipharm', '', 'Guatemala', '45698653', '', 1),
(9, 'Nielsen', '', 'Guatemala', '25647895', '', 1),
(10, 'Wellco', '', 'Guatemala', '45896532', '', 1),
(11, 'cxvxcvc', '', 'xvcxvcvcx', '563131456464564', '', 1),
(12, 'prueba', '', 'malacatan', '78956325', '', 1),
(13, 'prueba 2', '', 'dsfsdfasfds', '54132165', '', 1),
(14, 'otra prueba', '', 'GUATEMALA', '12345678', '', 1),
(16, 'Super toro', '', 'Malacatan', '12457896', '', 1),
(17, 'Medixela', '', 'xela', '77774563', '', 1),
(18, 'Vick', '', 'Guatemala', '45689656', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `idlote` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`idlote`, `numero`, `fecha_vencimiento`, `idsucu_c`) VALUES
(1, '493210902', '2024-08-01', 1),
(2, '16895', '2024-05-01', 1),
(3, 'bl466', '2024-07-01', 1),
(4, '210376', '2023-05-01', 1),
(5, '1912177', '2022-12-01', 1),
(6, '220204', '2027-01-01', 1),
(7, '210293', '2023-04-01', 1),
(8, '200569', '2022-10-26', 1),
(9, '00443', '2023-04-01', 1),
(10, 'f2104002', '2024-04-01', 1),
(13, 'pruebaF', '2030-01-01', 1),
(14, 'pruebaF2', '2023-01-01', 1),
(15, 'jajaja', '2024-01-01', 1),
(16, '21464354h5', '2024-04-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `idpresentacion` int(11) NOT NULL,
  `presentacion` varchar(255) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`idpresentacion`, `presentacion`, `idsucu_c`) VALUES
(1, 'blister con 3 tabletas', 1),
(2, 'jarabe 120ml', 1),
(3, 'jarabe 120ml', 1),
(4, 'solucion para respirador 5 ml', 1),
(5, 'solucion para respirador 10ml', 1),
(6, 'suspension 30ml', 1),
(7, 'suspension 20ml', 1),
(8, 'solucion oral 40ml', 1),
(9, 'solucion oral 5ml', 1),
(10, 'jaraba 200', 1),
(11, 'zzzz', 1),
(12, 'frasco muy grande', 1),
(13, 'dona de la buena', 1),
(14, 'sobre 5 gramos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `idlote` int(11) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `stockminimo` int(11) NOT NULL,
  `precio_compra` decimal(18,2) NOT NULL,
  `precio_venta` decimal(18,2) DEFAULT NULL,
  `descuento` decimal(18,2) DEFAULT NULL,
  `ventasujeta` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `reg_sanitario` varchar(255) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `idpresentacion` int(11) NOT NULL,
  `idlab_pro` int(11) NOT NULL,
  `idsintoma` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `codigo`, `idlote`, `descripcion`, `tipo`, `stock`, `stockminimo`, `precio_compra`, `precio_venta`, `descuento`, `ventasujeta`, `fecha_registro`, `reg_sanitario`, `idcategoria`, `idpresentacion`, `idlab_pro`, `idsintoma`, `estado`, `idsucu_c`) VALUES
(1, '', 1, 'Azitromicina 500mg', 'Generico', 4, 1, '0.00', '0.00', '0.00', 'sin receta medica', '2022-10-15', '', 1, 1, 2, 3, '1', 1),
(3, '', 3, 'Guayatos', 'Generico', 7, 2, '0.00', '0.00', '0.00', 'sin receta medica', '2022-10-19', '', 6, 2, 4, 6, '1', 1),
(4, '', 4, 'Aerovan sp', 'No Generico', 1, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 7, 4, 5, 7, '1', 1),
(5, '', 5, 'Albugenol', 'No Generico', 7, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 7, 5, 6, 7, '1', 1),
(6, '', 6, 'Bonatrim', 'Generico', 1, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 8, 6, 7, 8, '1', 1),
(7, '', 7, 'Iprak 750sp', 'No Generico', 3, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 9, 4, 5, 7, '1', 1),
(8, '', 8, 'Asmatol', 'No Generico', 0, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 7, 5, 7, 7, '1', 1),
(9, '', 9, 'clamicil', 'No Generico', 5, 1, '0.00', '0.00', '0.00', 'Con receta medica', '2022-10-19', '', 10, 1, 8, 3, '1', 1),
(10, '', 9, 'Aviplex', 'Generico', 25, 5, '0.00', '0.00', '0.00', 'sin receta medica', '2022-10-19', '', 11, 8, 9, 9, '1', 1),
(11, '', 10, 'KLOT-W', 'Generico', 30, 5, '0.00', '0.00', '0.00', 'sin receta medica', '2022-10-19', '', 12, 9, 10, 10, '1', 1),
(19, NULL, 1, 'VitaPyrena', 'Generico', 10, 1, '0.00', NULL, NULL, 'sin receta medica', '2022-10-31', NULL, NULL, 14, 18, 1, '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_similar`
--

CREATE TABLE `producto_similar` (
  `idp_similar` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `presentacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sintoma`
--

CREATE TABLE `sintoma` (
  `idsintoma` int(11) NOT NULL,
  `sintoma` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idsucu_c` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sintoma`
--

INSERT INTO `sintoma` (`idsintoma`, `sintoma`, `idsucu_c`) VALUES
(1, 'Resfriado', 1),
(2, 'Dolor de estomago', 1),
(3, 'Infecciones', 1),
(4, 'tos seca', 1),
(5, 'tos con flemas', 1),
(6, 'tos', 1),
(7, 'broncoespasmo', 1),
(8, 'infeccion urinaria', 1),
(9, 'vitaminas', 1),
(10, 'nausea', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `idsucursal` int(11) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `ruc_letra` varchar(30) NOT NULL,
  `ruc_num` char(30) NOT NULL,
  `representante` varchar(255) DEFAULT NULL,
  `serie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idsucursal`, `razon_social`, `direccion`, `telefono`, `ruc_letra`, `ruc_num`, `representante`, `serie`) VALUES
(1, 'Dispensario Clinica', 'Dispensario', '', '', '', '', '001'),
(7, 'Bodega General', 'General', '', '', '', NULL, '002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_usuario`
--

CREATE TABLE `sucursal_usuario` (
  `idsucu_usu` int(11) NOT NULL,
  `idsucu` int(11) NOT NULL,
  `idusuu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_usuario`
--

INSERT INTO `sucursal_usuario` (`idsucu_usu`, `idsucu`, `idusuu`) VALUES
(2, 1, 1),
(3, 1, 2),
(4, 7, 3),
(5, 7, 4),
(6, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusu`, `usuario`, `clave`, `cargo_usu`, `nombres`, `email`, `telefono`, `fechaingreso`, `tipo`, `estado`) VALUES
(1, 'nsantizo', '21232f297a57a5a743894a0e4a801fc3', 'Administrador', 'Nehemias Santizo', 'prueba@gmail.com', '12345678', '2017-09-05', 'ADMINISTRADOR', 'Activo'),
(2, 'epio', '21232f297a57a5a743894a0e4a801fc3', 'Usuario', 'Eduardo Pio', 'epiob@miumg.edu.gt', '59796718', '2022-10-12', 'USUARIO', 'Activo'),
(3, 'jperez', '21232f297a57a5a743894a0e4a801fc3', 'Usuario', 'Juan Perez', '', '', '2022-10-26', 'USUARIO', 'Activo'),
(4, 'vvillagran', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'Vivian Villagran', '', '45632589', '2022-10-29', 'ADMINISTRADOR', 'Activo'),
(5, 'mrb', '21232f297a57a5a743894a0e4a801fc3', 'Bodeguero', 'Mr Bodeguitas', '', '', '2022-11-01', 'BODEGA', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
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
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `fecha`, `subtotal`, `igv`, `total`, `efectivo`, `vuelto`, `tipo_docu`, `num_docu`, `serie`, `idsucu_c`) VALUES
(2, 1, 1, '2022-10-26', '0.00', '0.00', '0.00', '0.00', '0.00', 'TICKET', '0000000002', '001', 1),
(4, 1, 1, '2022-10-29', '0.00', '0.00', '0.00', '0.00', '0.00', 'TICKET', '0000000004', '001', 1);

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
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `documento_2` (`documento`),
  ADD UNIQUE KEY `documento_3` (`documento`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `FK_compra_proveedor_idprovedor` (`idlab_pro`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`idconfi`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD KEY `FK_detallecompra_productos_idproducto` (`idproducto`),
  ADD KEY `FK_detallecompra_compra_idcompra` (`idcompra`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD KEY `FK_detalleventa_productos_idproducto` (`idproducto`),
  ADD KEY `FK_detalleventa_venta_idventa` (`idventa`);

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
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `FK_productos_presentacion_idpresentacion` (`idpresentacion`),
  ADD KEY `FK_productos_categoria_idcategoria` (`idcategoria`),
  ADD KEY `FK_productos_laboratorio_idlab` (`idlab_pro`),
  ADD KEY `FK_productos_sintoma_idsintoma` (`idsintoma`),
  ADD KEY `FK_productos_lote_idlote` (`idlote`);

--
-- Indices de la tabla `producto_similar`
--
ALTER TABLE `producto_similar`
  ADD PRIMARY KEY (`idp_similar`),
  ADD KEY `FK_producto_similar_productos_idproducto` (`idproducto`);

--
-- Indices de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  ADD PRIMARY KEY (`idsintoma`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idsucursal`),
  ADD UNIQUE KEY `direccion` (`direccion`);

--
-- Indices de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  ADD PRIMARY KEY (`idsucu_usu`),
  ADD KEY `FK_sucursal_usuario_usuario_idusu` (`idusuu`),
  ADD KEY `FK_sucursal_usuario_sucursal_idsucursal` (`idsucu`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusu`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `FK_venta_usuario_idusu` (`idusuario`),
  ADD KEY `FK_venta_cliente_idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `laboratorio_proveedor`
--
ALTER TABLE `laboratorio_proveedor`
  MODIFY `idlab_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `idlote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `idpresentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `producto_similar`
--
ALTER TABLE `producto_similar`
  MODIFY `idp_similar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sintoma`
--
ALTER TABLE `sintoma`
  MODIFY `idsintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `idsucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sucursal_usuario`
--
ALTER TABLE `sucursal_usuario`
  MODIFY `idsucu_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
