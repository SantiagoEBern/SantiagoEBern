# Proyecto de Base de Datos: Registro del Personal del Servicio Penitenciario

## Descripción del Proyecto

Este proyecto consiste en el desarrollo de un sistema de base de datos relacional para gestionar el **registro del personal del servicio penitenciario**. El sistema permite almacenar y organizar información detallada sobre el personal, incluyendo sus datos personales, historial académico, sanciones, licencias, destinos, y más. Se estructura en diversas tablas interrelacionadas que facilitan la búsqueda y actualización de la información.

El proyecto se enfoca, además, en la implementación de estrategias de **Backup y Restore** de la base de datos, incluyendo **backup en línea**, con el fin de asegurar la integridad y recuperación de los datos.

## Objetivos del Proyecto

### Objetivo General
Desarrollar una base de datos eficiente y funcional para gestionar el registro del personal del servicio penitenciario, aplicando técnicas de backup y restore para garantizar la seguridad e integridad de la información.

### Objetivos Específicos
- Crear un sistema que facilite la **gestión de datos personales** y **laborales** del personal.
- Implementar un **sistema de subdivisiones** dentro de los datos, para simplificar la búsqueda y actualización de registros.
- Aplicar estrategias de **backup en línea** para asegurar la recuperación de datos en caso de pérdida o corrupción.
- Documentar el proceso de desarrollo y proporcionar una **guía de usuario** para la gestión de los datos.

## Estructura del Proyecto

### Tablas Principales
- **Datos Personales Primarios**: Almacena la información básica de cada miembro del personal, como nombre, fecha de nacimiento, DNI, contacto, entre otros.
- **Datos Personales Secundarios**: Registra información adicional sobre los familiares del personal, como padres, cónyuge e hijos.
- **Historial Académico**: Contiene información sobre el nivel académico alcanzado por el personal, incluyendo la fecha de obtención y las instituciones involucradas.
- **Sanciones**: Registra las sanciones impuestas al personal, detallando el motivo, el artículo relacionado y las observaciones.
- **Licencias**: Almacena información sobre las licencias otorgadas, como el tipo, fechas de inicio y fin, y observaciones.
- **Grados**: Detalla los grados y cargos jerárquicos dentro del servicio penitenciario.
- **Legajo**: Registro completo del personal, que relaciona sus datos personales, historial académico, sanciones, destino y otros atributos clave.

### Relaciones Clave
- **Legajo** está relacionado con varias otras tablas, como **Datos Personales Primarios**, **Sanciones**, **Historial Académico**, y **Destino**.
- Se utilizan claves foráneas para conectar entidades como **Provincia** y **Localidad**, asegurando que las ubicaciones del personal se mantengan correctamente referenciadas.

### Funcionalidades del Proyecto
- **Subdivisión automática**: Los registros actualizados en una categoría general se subdividen automáticamente según su categoría, facilitando la búsqueda y la actualización de información.
- **Implementación de Backup y Restore**: A lo largo del proyecto, se estudiarán y aplicarán técnicas de backup en línea, asegurando la integridad y disponibilidad de los datos.

## Uso del Sistema

1. **Actualización de Registros**: Los registros personales pueden ser actualizados fácilmente en una categoría general, y los cambios se reflejarán automáticamente en las subdivisiones correspondientes.
2. **Gestión de Licencias y Sanciones**: El sistema permite un seguimiento detallado de las licencias otorgadas y sanciones impuestas al personal.
3. **Backup y Restore**: Se implementarán procedimientos de backup para garantizar que los datos puedan ser restaurados en caso de cualquier eventualidad.

## Requisitos del Sistema

- **Sistema de Gestión de Bases de Datos (DBMS)**: El sistema ha sido diseñado para ser implementado en bases de datos SQL, como **MySQL** o **PostgreSQL**.
- **Lenguaje SQL**: Todas las consultas y procedimientos de la base de datos están desarrollados en SQL.

## Backup y Restore

El proyecto incluye la implementación de estrategias de **backup y restore**, con el enfoque en **backups en línea**. Esto permite que las copias de seguridad se realicen sin interrumpir las operaciones del sistema, asegurando la **continuidad del servicio** y la **integridad de los datos**.

### Estrategias de Backup
- **Backup completo**: Copia completa de la base de datos en intervalos regulares.
- **Backup incremental**: Solo copia los datos modificados desde el último backup completo o incremental.

### Restore
- Se documentarán los procedimientos para restaurar la base de datos desde cualquier punto de backup, con verificación de la integridad de los datos recuperados.

## Contribuciones
Este proyecto fue desarrollado como parte de la asignatura **Bases de Datos I**, aplicando los conocimientos adquiridos durante el curso sobre diseño y administración de bases de datos relacionales.

## Repositorio del Proyecto

El código completo y la documentación del proyecto están disponibles en el siguiente [repositorio Git](enlace-a-tu-repositorio).

## Licencia

Este proyecto está licenciado bajo los términos de la **MIT License**.

