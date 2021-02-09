<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'dDG{NZXZO]c^gc@7yS#+.uah~}X|aBQ><IELkUyoqPo,SxXc`Rak|w~1=d(JQuil');
define('SECURE_AUTH_KEY',  'KW%9a3#6HU&jBoq*QA9D,IxfPw%{u;DV:OWo2c4U+;@(KBXGUHZ2a[:%vW/lt&?K');
define('LOGGED_IN_KEY',    'LmD&#O!4^ttmYKmZ]lE+,VztxdR<+Wyc*F/%Yp$bTu]cOFr:<e#=)gw*rpsH}x/T');
define('NONCE_KEY',        's:P+b-J|l O-=M!@Y;.3ogqI&kFn.wem;F[|zi^{H@nq7tP+8-l-~v*-;Rt|w$Ma');
define('AUTH_SALT',        '3FgoSebX2PO&,jU{aOg5*-l[$wEw[uwA-Mvx+N&?x+h!aTH{SMA{ Q41c+VmM.-D');
define('SECURE_AUTH_SALT', 'w6e]{T}!O*NwSoIA LJRxA(3@n5rhbr[vY9EctsrK{q[u /3}>PK1jBF7#<`>l[8');
define('LOGGED_IN_SALT',   'T^+mN|Hw% l;:!NxPCBt6N_TZY,:.O9PLw+QjtC*|!2)3&Na|<:>4H8:O(.<H}:W');
define('NONCE_SALT',       '>I3r+Xdd4:wBRa_X5-h22~|>w3pZoe{m#>-o#3/etgZ/#;]b2`0/aDDDQ+ze7(rs');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';