-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2023 a las 15:18:12
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `Id_Autor` int(11) NOT NULL,
  `Nombre_Autor` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `Nacionalidad_Autor` varchar(50) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`Id_Autor`, `Nombre_Autor`, `Nacionalidad_Autor`) VALUES
(1, 'Gabriel García Marquez', 'Colombia'),
(2, 'J.K. Rowling', 'Reino Unido'),
(3, 'Haruki Murakami', 'Japón'),
(4, 'Jane Austen', 'Reino Unido'),
(5, 'Ernest Hemingway', 'Estados Unidos'),
(6, 'Isabel Allende', 'Chile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(50) COLLATE utf32_spanish_ci NOT NULL,
  `Dni_Cliente` int(10) NOT NULL,
  `Direccion_Cliente` varchar(50) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nombre_Cliente`, `Dni_Cliente`, `Direccion_Cliente`) VALUES
(1, 'Juan Pérez', 38962351, 'Calle Principal 123'),
(2, 'María López', 37726382, 'Avenida Central 456'),
(3, 'Carlos Ramirez', 40231234, 'Plaza Mayor 789'),
(4, 'Ana García', 39672321, 'Boulevard Norte 101'),
(5, 'Pedro Martínez', 39627382, 'Paseo del Sol 222'),
(6, 'Laura González', 41928302, 'Rua das Flores 567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `Id_Genero` int(11) NOT NULL,
  `Nombre_Genero` varchar(50) COLLATE utf32_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`Id_Genero`, `Nombre_Genero`) VALUES
(1, 'Ficción'),
(2, 'Fantasia'),
(3, 'Drama'),
(4, 'Romance'),
(5, 'Aventura'),
(6, 'Histórico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `Id_Libro` int(11) NOT NULL,
  `Titulo_Libro` varchar(100) COLLATE utf32_spanish_ci NOT NULL,
  `Autor_Libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`Id_Libro`, `Titulo_Libro`, `Autor_Libro`) VALUES
(1, 'Cien años de soledad', 1),
(2, 'Harry Potter y la piedra filosofal', 2),
(3, 'Tokio Blues', 3),
(4, 'Orgullo y prejuicio', 4),
(5, 'El viejo y el mar', 5),
(6, 'La casa de los espíritus', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_genero`
--

CREATE TABLE `libro_genero` (
  `Id_LG` int(11) NOT NULL,
  `Libro_Id` int(11) NOT NULL,
  `Genero_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `libro_genero`
--

INSERT INTO `libro_genero` (`Id_LG`, `Libro_Id`, `Genero_Id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 4),
(4, 3, 1),
(5, 4, 4),
(6, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `Id_Prestamo` int(11) NOT NULL,
  `Libro_Prestamo` int(11) NOT NULL,
  `Cliente_Prestamo` int(11) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`Id_Prestamo`, `Libro_Prestamo`, `Cliente_Prestamo`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, 1, 1, '2023-06-01', '2023-06-04'),
(2, 2, 2, '2023-06-05', '0000-00-00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Id_Autor`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Id_Genero`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Id_Libro`),
  ADD KEY `Autor_Libro` (`Autor_Libro`);

--
-- Indices de la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  ADD PRIMARY KEY (`Id_LG`),
  ADD KEY `Genero_Id` (`Genero_Id`),
  ADD KEY `Libro_Id` (`Libro_Id`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`Id_Prestamo`),
  ADD KEY `Libro_Prestamo` (`Libro_Prestamo`),
  ADD KEY `Cliente_Prestamo` (`Cliente_Prestamo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `Id_Autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `Id_Genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `Id_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  MODIFY `Id_LG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `Id_Prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`Autor_Libro`) REFERENCES `autor` (`Id_Autor`);

--
-- Filtros para la tabla `libro_genero`
--
ALTER TABLE `libro_genero`
  ADD CONSTRAINT `libro_genero_ibfk_1` FOREIGN KEY (`Genero_Id`) REFERENCES `genero` (`Id_Genero`),
  ADD CONSTRAINT `libro_genero_ibfk_2` FOREIGN KEY (`Libro_Id`) REFERENCES `libro` (`Id_Libro`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`Libro_Prestamo`) REFERENCES `libro` (`Id_Libro`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`Cliente_Prestamo`) REFERENCES `cliente` (`Id_Cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
