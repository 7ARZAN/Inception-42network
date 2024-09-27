<?php

/**REDIS CACHE CONFIGURATION */
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_CACHE_KEY_SALT', 'elakhfif@1337.ma');

/*---------------------------------- */
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db' );

/** Database username */
define( 'DB_USER', 'user' );

/** Database password */
define( 'DB_PASSWORD', 'tmp' );

/** Database hostname */
define( 'DB_HOST', 'host' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '>zV!l-4isW6ZvLzWKd@M64F{+O(F|cGoR;`Z9jFq@E0r[VoR9?v[ZC~g4-B-iSK#');
define('SECURE_AUTH_KEY',  'O:#|Nip,^d-$nZ^}e1hjI~hp^OWyGt,(Sqpuywzz_slS_+`}t?vkPHCkR]>$-2iK');
define('LOGGED_IN_KEY',    'Fb7@V{SMl#[fh)%8%Kk-:Ri@u(uC#1w`_?TT:q>~xyJ: z:2.$gbVn$vaIoKST+v');
define('NONCE_KEY',        'J1J)9.[.+;~Q?_)*I6M_5b+1f:16~PW^3^EX&YHl1<mqoIr~6HhiAQQT5{2pcrXp');
define('AUTH_SALT',        'd[D8 }r,&VWNQBr2U{0I*Er3k=jJLF{_W=q*;)=$S#OurZEOG`w<)ERi33y5EyoU');
define('SECURE_AUTH_SALT', '%HH+eMl`%)qy[9b32;m9z6V+TrpRV:OdZ+y*1~)K_++Hn+0*fIV 3o6BH7vuBqoV');
define('LOGGED_IN_SALT',   '{ty4P|QvzDdv|].PWCXK%4-T*r.Ezp:q:9.J,eeLU4?.-pYB085By~` vHQvvv1`');
define('NONCE_SALT',       '}!d3sCIQ!}Yhp;/[1c!H=S+1YE&Ab~d=bLkI$T%9Wbf8h(GS=9/elfJ>@Ks|y9F&');

/**#@-*/

/**
 * WordPress database table prefix.
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
