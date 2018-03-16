# QTRANSLATE CLEANUP QUERIES

# create temp column to separate post content on <!--more--> tag to simplify queries
ALTER TABLE  `wp_posts` ADD  `tmp_excerpt` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE  `wp_2_posts` ADD  `tmp_excerpt` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE  `wp_3_posts` ADD  `tmp_excerpt` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


# split content

## fill `tmp_exceprt` column
UPDATE wp_posts SET tmp_excerpt =
SUBSTRING(
    post_content
    FROM 1
    FOR LOCATE(
        '<!--more-->',
        post_content
    ) - 1
) ;
UPDATE wp_2_posts SET tmp_excerpt =
SUBSTRING(
    post_content
    FROM 1
    FOR LOCATE(
        '<!--more-->',
        post_content
    ) - 1
) ;
UPDATE wp_3_posts SET tmp_excerpt =
SUBSTRING(
    post_content
    FROM 1
    FOR LOCATE(
        '<!--more-->',
        post_content
    ) - 1
) ;
## fill strip the excerpt from `post_content` column
UPDATE wp_posts SET post_content = case when
LOCATE('<!--more-->', post_content) > 0
then
SUBSTRING(
    post_content
    FROM LOCATE(
        '<!--more-->',
        post_content
    ) + 11
)
else
post_content
end;

UPDATE wp_2_posts SET post_content = case when
LOCATE('<!--more-->', post_content) > 0
then
SUBSTRING(
    post_content
    FROM LOCATE(
        '<!--more-->',
        post_content
    ) + 11
)
else
post_content
end;

UPDATE wp_3_posts SET post_content = case when
LOCATE('<!--more-->', post_content) > 0
then
SUBSTRING(
    post_content
    FROM LOCATE(
        '<!--more-->',
        post_content
    ) + 11
)
else
post_content
end;


# clean the qTranslate data, leaving only english

## `post_content`

### strip after "en" content
UPDATE wp_posts SET post_content = case when
LOCATE('[:es]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM 1
        FOR LOCATE(
                '[:',
                post_content,
                LOCATE('[:es]', post_content) + 5
        ) - 1
)
else
post_content
end;

UPDATE wp_2_posts SET post_content = case when
LOCATE('[:en]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM 1
        FOR LOCATE(
                '[:',
                post_content,
                LOCATE('[:en]', post_content) + 5
        ) - 1
)
else
post_content
end;

UPDATE wp_3_posts SET post_content = case when
LOCATE('[:ca]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM 1
        FOR LOCATE(
                '[:',
                post_content,
                LOCATE('[:ca]', post_content) + 5
        ) - 1
)
else
post_content
end;

### strip before "en" content
UPDATE wp_posts SET post_content = case when
LOCATE('[:es]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM LOCATE(
                '[:es]',
                post_content
        ) + 5
)
else
post_content
end;

UPDATE wp_2_posts SET post_content = case when
LOCATE('[:en]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM LOCATE(
                '[:en]',
                post_content
        ) + 5
)
else
post_content
end;

UPDATE wp_3_posts SET post_content = case when
LOCATE('[:ca]', post_content) > 0
then
SUBSTRING(
    post_content
        FROM LOCATE(
                '[:ca]',
                post_content
        ) + 5
)
else
post_content
end;

## `tmp_excerpt`

### strip after "en" content
UPDATE wp_posts SET tmp_excerpt = case when
LOCATE('[:es]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                tmp_excerpt,
                LOCATE('[:es]', tmp_excerpt) + 5
        ) - 1
)
else
tmp_excerpt
end;

UPDATE wp_2_posts SET tmp_excerpt = case when
LOCATE('[:en]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                tmp_excerpt,
                LOCATE('[:en]', tmp_excerpt) + 5
        ) - 1
)
else
tmp_excerpt
end;

UPDATE wp_3_posts SET tmp_excerpt = case when
LOCATE('[:ca]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                tmp_excerpt,
                LOCATE('[:ca]', tmp_excerpt) + 5
        ) - 1
)
else
tmp_excerpt
end;

### strip before "en" content
UPDATE wp_posts SET tmp_excerpt = case when
LOCATE('[:es]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM LOCATE(
                '[:es]',
                tmp_excerpt
        ) + 5
)
else
tmp_excerpt
end;

UPDATE wp_2_posts SET tmp_excerpt = case when
LOCATE('[:en]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM LOCATE(
                '[:en]',
                tmp_excerpt
        ) + 5
)
else
tmp_excerpt
end;

UPDATE wp_3_posts SET tmp_excerpt = case when
LOCATE('[:ca]', tmp_excerpt) > 0
then
SUBSTRING(
    tmp_excerpt
        FROM LOCATE(
                '[:ca]',
                tmp_excerpt
        ) + 5
)
else
tmp_excerpt
end;




## `post_title`

### strip after "en" content
UPDATE wp_posts SET post_title = case when
LOCATE('[:es]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM 1
        FOR LOCATE(
                '[:',
                post_title,
                LOCATE('[:es]', post_title) + 5
        ) - 1
)
else
post_title
end;

UPDATE wp_2_posts SET post_title = case when
LOCATE('[:en]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM 1
        FOR LOCATE(
                '[:',
                post_title,
                LOCATE('[:en]', post_title) + 5
        ) - 1
)
else
post_title
end;

UPDATE wp_3_posts SET post_title = case when
LOCATE('[:ca]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM 1
        FOR LOCATE(
                '[:',
                post_title,
                LOCATE('[:ca]', post_title) + 5
        ) - 1
)
else
post_title
end;

### strip before "en" content
UPDATE wp_posts SET post_title = case when
LOCATE('[:es]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM LOCATE(
                '[:es]',
                post_title
        ) + 5
)
else
post_title
end;

UPDATE wp_2_posts SET post_title = case when
LOCATE('[:en]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM LOCATE(
                '[:en]',
                post_title
        ) + 5
)
else
post_title
end;

UPDATE wp_3_posts SET post_title = case when
LOCATE('[:ca]', post_title) > 0
then
SUBSTRING(
    post_title
        FROM LOCATE(
                '[:ca]',
                post_title
        ) + 5
)
else
post_title
end;


## `post_excerpt`

### strip after "en" content
UPDATE wp_posts SET post_excerpt = case when
LOCATE('[:es]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                post_excerpt,
                LOCATE('[:es]', post_excerpt) + 5
        ) - 1
)
else
post_excerpt
end;

UPDATE wp_2_posts SET post_excerpt = case when
LOCATE('[:en]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                post_excerpt,
                LOCATE('[:en]', post_excerpt) + 5
        ) - 1
)
else
post_excerpt
end;

UPDATE wp_3_posts SET post_excerpt = case when
LOCATE('[:ca]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM 1
        FOR LOCATE(
                '[:',
                post_excerpt,
                LOCATE('[:ca]', post_excerpt) + 5
        ) - 1
)
else
post_excerpt
end;

### strip before "en" content
UPDATE wp_posts SET post_excerpt = case when
LOCATE('[:es]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM LOCATE(
                '[:es]',
                post_excerpt
        ) + 5
)
else
post_excerpt
end;

UPDATE wp_2_posts SET post_excerpt = case when
LOCATE('[:en]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM LOCATE(
                '[:en]',
                post_excerpt
        ) + 5
)
else
post_excerpt
end;

UPDATE wp_3_posts SET post_excerpt = case when
LOCATE('[:ca]', post_excerpt) > 0
then
SUBSTRING(
    post_excerpt
        FROM LOCATE(
                '[:ca]',
                post_excerpt
        ) + 5
)
else
post_excerpt
end;

# combine the `tmp_excerpt` back into `post_content` and clean up

## concatenate `tmp_excerpt` and `post_content` back
UPDATE wp_posts SET post_content = case when
CHAR_LENGTH(tmp_excerpt) > 0
then
CONCAT(
    tmp_excerpt,
    '<!--more-->',
    post_content
)
else
post_content
end;

UPDATE wp_2_posts SET post_content = case when
CHAR_LENGTH(tmp_excerpt) > 0
then
CONCAT(
    tmp_excerpt,
    '<!--more-->',
    post_content
)
else
post_content
end;

UPDATE wp_3_posts SET post_content = case when
CHAR_LENGTH(tmp_excerpt) > 0
then
CONCAT(
    tmp_excerpt,
    '<!--more-->',
    post_content
)
else
post_content
end;

## drop the `tmp_excerpt` column
ALTER TABLE `wp_posts` DROP `tmp_excerpt`;
ALTER TABLE `wp_2_posts` DROP `tmp_excerpt`;
ALTER TABLE `wp_3_posts` DROP `tmp_excerpt`;