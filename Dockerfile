FROM php:8.1-fpm

# Copy composer.lock and composer.json
# COPY composer.json /var/www/

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    default-mysql-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    unixodbc libgss3 odbcinst \
    devscripts debhelper dh-exec dh-autoreconf libreadline-dev libltdl-dev \
    unixodbc-dev wget \
    zlib1g-dev libicu-dev g++ \
    subversion

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions pdo_mysql zip exif pcntl mbstring gd intl
# RUN docker-php-ext-install pdo_mysql zip exif pcntl
# RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
# RUN docker-php-ext-install gd
# RUN docker-php-ext-configure intl
# RUN docker-php-ext-install intl

# Add Microsoft repo for Microsoft ODBC Driver 17 for Linux
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
&& apt-get update

RUN apt-get update && ACCEPT_EULA=Y apt-get install -y \
    msodbcsql17

# Enable the php extensions.
# RUN pecl install pdo_sqlsrv-5.6.1 sqlsrv-5.6.1 \
# && docker-php-ext-enable pdo_sqlsrv sqlsrv

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
# RUN groupadd -g 1000 www
# RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
# COPY . /var/www

# Copy existing application directory permissions
# COPY --chown=www:www . /var/www

# Change current user to www
# USER www

# Expose port 9000 and start php-fpm server
# EXPOSE 9000
# CMD ["php-fpm"]

RUN mv /etc/apt/sources.list.d/mssql-release.list ~/

RUN apt-get update && apt-get install -y \
    unixodbc-dev

RUN install-php-extensions pdo_sqlsrv sqlsrv

# Set working directory
WORKDIR /var/www