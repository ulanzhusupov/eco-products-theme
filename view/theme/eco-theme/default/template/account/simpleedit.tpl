<?php if (!$ajax && !$popup && !$as_module) { ?>
<?php $simple_page = 'simpleedit'; include $simple_header; ?>
<div class="simple-content">
<?php } ?>
    <?php if (!$ajax || ($ajax && $popup)) { ?>
    <script type="text/javascript">
        if (typeof simple !== "undefined") {
            simple.copyProperties({
                additionalParams: "<?php echo $additional_params ?>",
                additionalPath: "<?php echo $additional_path ?>",
                mainUrl: "<?php echo $action; ?>",
                mainContainer: "#simplepage_form",
                useAutocomplete: 0,
                useGoogleApi: 0,
                scrollToError: <?php echo $scroll_to_error ? 1 : 0 ?>,
                javascriptCallback: function() {<?php echo $javascript_callback ?>}
            });
        } else {
            //console.log("check header.tpl")
        }
    </script>
    <?php } ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="simplepage_form"> 
        <div class="simpleregister" id="simpleedit">
            <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
            <?php } ?>
            <div class="simpleregister-block-content">
                <?php foreach ($rows as $row) { ?>
                  <?php echo $row ?>
                <?php } ?>
            </div>
            <div class="simpleregister-button-block buttons">
                <div class="simpleregister-button-right">
                    <a class="button btn-primary button_oc btn" data-onclick="submit" id="simpleregister_button_confirm"><span><?php echo $button_continue; ?></span></a>
                </div>
            </div>
        </div>
        <?php if ($redirect) { ?>
            <script type="text/javascript">
                location = "<?php echo $redirect ?>";
            </script>
        <?php } ?>
    </form>
    <?php if ($popup) { ?>
        <script type="text/javascript">
            if (typeof simplepage !== "undefined") {
                simplepage.init(true);
            }
        </script>
    <?php } ?>
<?php if (!$ajax && !$popup && !$as_module) { ?>
</div>
<?php include $simple_footer ?>
<?php } ?>