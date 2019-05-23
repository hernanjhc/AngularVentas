-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-05-2019 a las 20:53:45
-- Versión del servidor: 5.6.42-log
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
-- Base de datos: `Ventas`
--
CREATE DATABASE IF NOT EXISTS `Ventas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Ventas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Bancos`
--

CREATE TABLE `Bancos` (
  `Id` int(11) NOT NULL,
  `Banco` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BancoSucursal`
--

CREATE TABLE `BancoSucursal` (
  `Id` int(11) NOT NULL,
  `IdBanco` int(11) NOT NULL,
  `SucursalNro` int(11) NOT NULL,
  `Sucursal` varchar(100) NOT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Web` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE `barrios` (
  `Id` int(11) NOT NULL,
  `Barrio` varchar(45) COLLATE utf8_bin NOT NULL,
  `IdLocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `Id` int(11) NOT NULL,
  `Departamento` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `IdProvincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EArticulos`
--

CREATE TABLE `EArticulos` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `CodBarra` varchar(50) COLLATE utf8_bin NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8_bin NOT NULL,
  `IdMarca` int(11) DEFAULT NULL,
  `IdRubro` int(11) DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  `IdUnidad` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `CostoInicial` decimal(17,2) NOT NULL,
  `CostoAdicional1` decimal(17,2) NOT NULL,
  `CostoAdicional2` decimal(17,2) NOT NULL,
  `Costo` decimal(17,2) NOT NULL,
  `Stock` int(11) DEFAULT NULL,
  `StockMinimo` int(11) NOT NULL,
  `PrecioL1` decimal(17,2) DEFAULT NULL,
  `PrecioL2` decimal(17,2) DEFAULT NULL,
  `PrecioL3` decimal(17,2) DEFAULT NULL,
  `Observaciones` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ECheques`
--

CREATE TABLE `ECheques` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdBanco` int(11) NOT NULL,
  `Nro` decimal(17,0) NOT NULL,
  `Importe` decimal(17,2) NOT NULL,
  `Emision` datetime NOT NULL,
  `Vencimiento` datetime NOT NULL,
  `TitularIdTipoDoc` int(100) NOT NULL,
  `TitularNroDoc` decimal(17,0) NOT NULL,
  `TitularDireccion` varchar(100) NOT NULL,
  `EndosaIdTipoDoc` int(11) NOT NULL,
  `EndosaNroDoc` decimal(17,0) NOT NULL,
  `EndosaDireccion` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EClientes`
--

CREATE TABLE `EClientes` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `RazonSocial` varchar(45) COLLATE utf8_bin NOT NULL,
  `IdTipoDoc` int(11) NOT NULL,
  `NroDoc` decimal(17,0) NOT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Celular` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ECompras`
--

CREATE TABLE `ECompras` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `IdProveedor` int(11) NOT NULL,
  `Importe` decimal(17,2) NOT NULL,
  `Retirado` int(11) DEFAULT NULL,
  `Pagado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EComprasDetalles`
--

CREATE TABLE `EComprasDetalles` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdCompra` int(11) NOT NULL,
  `IdArticulo` int(11) NOT NULL,
  `Precio` decimal(17,0) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` decimal(17,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ECuentas`
--

CREATE TABLE `ECuentas` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `IdReferencia` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `SaldoInicial` decimal(17,2) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDepositos`
--

CREATE TABLE `EDepositos` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Deposito` varchar(50) NOT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Dirección` varchar(50) DEFAULT NULL,
  `IdEncargadoUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMarca`
--

CREATE TABLE `EMarca` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Marca` varchar(45) COLLATE utf8_bin NOT NULL,
  `Observaciones` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMovimDinero`
--

CREATE TABLE `EMovimDinero` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdCuenta` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Detalle` varchar(100) NOT NULL,
  `Credito` decimal(17,2) NOT NULL,
  `Debito` decimal(17,2) NOT NULL,
  `Saldo` decimal(17,2) NOT NULL,
  `IdCheque` int(11) DEFAULT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `IdCompra` int(11) DEFAULT NULL,
  `IdNotaCredito` int(11) DEFAULT NULL,
  `IdNotaDebito` int(11) DEFAULT NULL,
  `Contrasiento` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMovimStock`
--

CREATE TABLE `EMovimStock` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `IdArticulo` int(11) NOT NULL,
  `IdProveedorOrigen` int(11) DEFAULT NULL,
  `IdClienteOrigen` int(11) DEFAULT NULL,
  `IdDepositoOrigen` int(11) DEFAULT NULL,
  `IdProveedorDestino` int(11) DEFAULT NULL,
  `IdClienteDestino` int(11) DEFAULT NULL,
  `IdDepositoDestino` int(11) DEFAULT NULL,
  `Ingreso` decimal(17,2) NOT NULL,
  `Egreso` decimal(17,2) NOT NULL,
  `Stock` decimal(17,2) NOT NULL,
  `IdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empresas`
--

CREATE TABLE `Empresas` (
  `Id` int(11) NOT NULL,
  `RazonSocial` varchar(100) NOT NULL,
  `IdTipoDoc` int(11) NOT NULL,
  `NroDoc` decimal(17,0) NOT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL,
  `Presupuesto` int(11) NOT NULL DEFAULT '0',
  `Venta` int(11) NOT NULL DEFAULT '0',
  `Remito` int(11) NOT NULL DEFAULT '0',
  `NotaDebito` int(11) NOT NULL DEFAULT '0',
  `NotaCredito` int(11) NOT NULL DEFAULT '0',
  `Compra` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EPresupuestos`
--

CREATE TABLE `EPresupuestos` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `DiasValidez` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `PrecioLista` int(11) DEFAULT NULL,
  `Estado` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Importe` decimal(17,2) DEFAULT NULL,
  `Descuento` int(11) DEFAULT NULL,
  `ImporteTotal` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EPresupuestosDetalles`
--

CREATE TABLE `EPresupuestosDetalles` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdPresupuesto` int(11) NOT NULL,
  `IdArticulo` int(11) NOT NULL,
  `Cantidad` decimal(17,2) DEFAULT NULL,
  `Precio` decimal(17,2) DEFAULT NULL,
  `Importe` decimal(17,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EProveedores`
--

CREATE TABLE `EProveedores` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `RazonSocial` varchar(45) COLLATE utf8_bin NOT NULL,
  `IdTipoDoc` int(11) NOT NULL,
  `NroDoc` decimal(17,0) DEFAULT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Celular` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ERemitos`
--

CREATE TABLE `ERemitos` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Entrega` varchar(45) DEFAULT NULL,
  `RecibeNombre` varchar(45) DEFAULT NULL,
  `RecibeTipoDoc` int(11) DEFAULT NULL,
  `RecibeNroDoc` decimal(11,0) DEFAULT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ERemitosDetalles`
--

CREATE TABLE `ERemitosDetalles` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdArticulo` int(11) NOT NULL,
  `IdRemito` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ERubros`
--

CREATE TABLE `ERubros` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Rubro` varchar(50) NOT NULL,
  `Observaciones` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVentas`
--

CREATE TABLE `EVentas` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Lista` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Importe` decimal(17,2) NOT NULL,
  `Descuento` decimal(17,2) NOT NULL,
  `ImporteTotal` decimal(17,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVentasDetalles`
--

CREATE TABLE `EVentasDetalles` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `IdArticulo` int(11) NOT NULL,
  `IdVenta` int(11) NOT NULL,
  `PrecioVenta` decimal(17,2) NOT NULL,
  `Precio` decimal(17,2) NOT NULL,
  `Cantidad` decimal(17,2) NOT NULL,
  `Importe` decimal(17,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `Id` int(11) NOT NULL,
  `Localidad` varchar(45) COLLATE utf8_bin NOT NULL,
  `IdDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `Id` int(11) NOT NULL,
  `Provincia` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdocumento`
--

CREATE TABLE `tiposdocumento` (
  `Id` int(11) NOT NULL,
  `TipoDocumento` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `Id` int(11) NOT NULL,
  `Unidad` varchar(30) NOT NULL,
  `Observaciones` varchar(100) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id` int(11) NOT NULL,
  `IdEmpresa` int(11) NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdTipoDoc` int(11) NOT NULL,
  `NroDoc` decimal(17,0) NOT NULL,
  `IdProvincia` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  `IdLocalidad` int(11) DEFAULT NULL,
  `IdBarrio` int(11) DEFAULT NULL,
  `Dirrecion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Bancos`
--
ALTER TABLE `Bancos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `BancoSucursal`
--
ALTER TABLE `BancoSucursal`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdLocalidad` (`IdLocalidad`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdProvincia` (`IdProvincia`);

--
-- Indices de la tabla `EArticulos`
--
ALTER TABLE `EArticulos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdMarca` (`IdMarca`);

--
-- Indices de la tabla `EClientes`
--
ALTER TABLE `EClientes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdTipoDoc` (`IdTipoDoc`),
  ADD KEY `IdProvincia` (`IdProvincia`),
  ADD KEY `IdDepartamento` (`IdDepartamento`),
  ADD KEY `IdLocalidad` (`IdLocalidad`),
  ADD KEY `IdBarrio` (`IdBarrio`);

--
-- Indices de la tabla `ECompras`
--
ALTER TABLE `ECompras`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EComprasDetalles`
--
ALTER TABLE `EComprasDetalles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ECuentas`
--
ALTER TABLE `ECuentas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EDepositos`
--
ALTER TABLE `EDepositos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EMarca`
--
ALTER TABLE `EMarca`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EMovimDinero`
--
ALTER TABLE `EMovimDinero`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Empresas`
--
ALTER TABLE `Empresas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EPresupuestos`
--
ALTER TABLE `EPresupuestos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EPresupuestosDetalles`
--
ALTER TABLE `EPresupuestosDetalles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EProveedores`
--
ALTER TABLE `EProveedores`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdTipoDoc` (`IdTipoDoc`),
  ADD KEY `IdProvincia` (`IdProvincia`),
  ADD KEY `IdDepartamento` (`IdDepartamento`),
  ADD KEY `IdLocalidad` (`IdLocalidad`),
  ADD KEY `IdBarrio` (`IdBarrio`);

--
-- Indices de la tabla `ERemitos`
--
ALTER TABLE `ERemitos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ERemitosDetalles`
--
ALTER TABLE `ERemitosDetalles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ERubros`
--
ALTER TABLE `ERubros`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EVentas`
--
ALTER TABLE `EVentas`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `EVentasDetalles`
--
ALTER TABLE `EVentasDetalles`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdDepartamento` (`IdDepartamento`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tiposdocumento`
--
ALTER TABLE `tiposdocumento`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Bancos`
--
ALTER TABLE `Bancos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `BancoSucursal`
--
ALTER TABLE `BancoSucursal`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `barrios`
--
ALTER TABLE `barrios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EArticulos`
--
ALTER TABLE `EArticulos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EClientes`
--
ALTER TABLE `EClientes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ECompras`
--
ALTER TABLE `ECompras`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EComprasDetalles`
--
ALTER TABLE `EComprasDetalles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ECuentas`
--
ALTER TABLE `ECuentas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EDepositos`
--
ALTER TABLE `EDepositos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EMarca`
--
ALTER TABLE `EMarca`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EMovimDinero`
--
ALTER TABLE `EMovimDinero`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Empresas`
--
ALTER TABLE `Empresas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EPresupuestos`
--
ALTER TABLE `EPresupuestos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EPresupuestosDetalles`
--
ALTER TABLE `EPresupuestosDetalles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EProveedores`
--
ALTER TABLE `EProveedores`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ERemitos`
--
ALTER TABLE `ERemitos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ERemitosDetalles`
--
ALTER TABLE `ERemitosDetalles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ERubros`
--
ALTER TABLE `ERubros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EVentas`
--
ALTER TABLE `EVentas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EVentasDetalles`
--
ALTER TABLE `EVentasDetalles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localidades`
--
ALTER TABLE `localidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposdocumento`
--
ALTER TABLE `tiposdocumento`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD CONSTRAINT `barrios_ibfk_1` FOREIGN KEY (`IdLocalidad`) REFERENCES `localidades` (`Id`);

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`Id`);

--
-- Filtros para la tabla `EArticulos`
--
ALTER TABLE `EArticulos`
  ADD CONSTRAINT `EArticulos_ibfk_1` FOREIGN KEY (`IdMarca`) REFERENCES `EMarca` (`Id`);

--
-- Filtros para la tabla `EClientes`
--
ALTER TABLE `EClientes`
  ADD CONSTRAINT `EClientes_ibfk_1` FOREIGN KEY (`IdTipoDoc`) REFERENCES `tiposdocumento` (`Id`),
  ADD CONSTRAINT `EClientes_ibfk_2` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`Id`),
  ADD CONSTRAINT `EClientes_ibfk_3` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`),
  ADD CONSTRAINT `EClientes_ibfk_4` FOREIGN KEY (`IdLocalidad`) REFERENCES `localidades` (`Id`),
  ADD CONSTRAINT `EClientes_ibfk_5` FOREIGN KEY (`IdBarrio`) REFERENCES `barrios` (`Id`);

--
-- Filtros para la tabla `EProveedores`
--
ALTER TABLE `EProveedores`
  ADD CONSTRAINT `EProveedores_ibfk_1` FOREIGN KEY (`IdTipoDoc`) REFERENCES `tiposdocumento` (`Id`),
  ADD CONSTRAINT `EProveedores_ibfk_2` FOREIGN KEY (`IdProvincia`) REFERENCES `provincias` (`Id`),
  ADD CONSTRAINT `EProveedores_ibfk_3` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`),
  ADD CONSTRAINT `EProveedores_ibfk_4` FOREIGN KEY (`IdLocalidad`) REFERENCES `localidades` (`Id`),
  ADD CONSTRAINT `EProveedores_ibfk_5` FOREIGN KEY (`IdBarrio`) REFERENCES `barrios` (`Id`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
