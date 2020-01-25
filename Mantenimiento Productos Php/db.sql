-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 27-04-2013 a las 02:34:41
-- Versión del servidor: 5.0.45
-- Versión de PHP: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `practica`
-- 
CREATE DATABASE `practica` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `practica`;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `categoria`
-- 

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL auto_increment,
  `Nombre` varchar(45) collate utf8_spanish2_ci NOT NULL,
  PRIMARY KEY  (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `categoria`
-- 

INSERT INTO `categoria` VALUES (1, 'Cuaderno');
INSERT INTO `categoria` VALUES (2, 'Libro');
INSERT INTO `categoria` VALUES (3, 'Lapicero');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `producto`
-- 

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL auto_increment,
  `Nombre` varchar(45) collate utf8_spanish2_ci NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  PRIMARY KEY  (`idProducto`,`idProveedor`,`idCategoria`),
  KEY `fk_Producto_Proveedor` (`idProveedor`),
  KEY `fk_Producto_Categoria1` (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `producto`
-- 

INSERT INTO `producto` VALUES (1, 'Lucas', 15.50, 2, 1, 21);
INSERT INTO `producto` VALUES (2, 'Condorito', 10.20, 1, 2, 10);
INSERT INTO `producto` VALUES (3, 'Pilot', 2.50, 3, 3, 25);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `proveedor`
-- 

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL auto_increment,
  `Nombre` varchar(45) collate utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(45) collate utf8_spanish2_ci NOT NULL,
  `Telefono` int(11) NOT NULL,
  `DNI` int(11) NOT NULL,
  PRIMARY KEY  (`idProveedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `proveedor`
-- 

INSERT INTO `proveedor` VALUES (1, 'Victor', 'Gonzales Mendez', 206249, 12345678);
INSERT INTO `proveedor` VALUES (2, 'Walter', 'Infantas Morales', 624920, 45678123);
INSERT INTO `proveedor` VALUES (3, 'Nolberto', 'Escalante Aguilar', 622049, 34567812);

-- 
-- Filtros para las tablas descargadas (dump)
-- 

-- 
-- Filtros para la tabla `producto`
-- 
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
