{include file="inc/header.tpl"}

<h2>{$LANG.config_site}</h2>

{include file="inc/errors.tpl"}

<form method="post" action="{$smarty.const.PH7_URL_SLUG_INSTALL}config_site">

    <p><span class="mandatory">*</span> <label for="site_name">{$LANG.site_name} :</label><br />
    <input type="text" name="site_name" id="site_name" onfocus="if('My Own Social/Dating Site!' == this.value) this.value='';" onblur="if ('' == this.value) this.value = 'My Own Social/Dating Site!';" value="{$smarty.session.val.site_name|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_username">{$LANG.admin_username} :</label><br />
    <input type="text" name="admin_username" id="admin_username" onfocus="if('administrator' == this.value) this.value='';" onblur="if ('' == this.value) this.value = 'administrator';" value="{$smarty.session.val.admin_username|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_password">{$LANG.admin_password} :</label><br />
    <input type="password" name="admin_password" id="admin_password" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_passwords">{$LANG.admin_passwords} :</label><br />
    <input type="password" name="admin_passwords" id="admin_passwords" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_first_name">{$LANG.admin_first_name} :</label><br />
    <input type="text" name="admin_first_name" id="admin_first_name" value="{$smarty.session.val.admin_first_name|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_last_name">{$LANG.admin_last_name} :</label><br />
    <input type="text" name="admin_last_name" id="admin_last_name" value="{$smarty.session.val.admin_last_name|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_email">{$LANG.admin_login_email} :</label><br />
    <input type="email" name="admin_login_email" id="admin_login_email" value="{$smarty.session.val.admin_login_email|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_email">{$LANG.admin_email} :</label><br />
    <input type="email" name="admin_email" id="admin_email" value="{$smarty.session.val.admin_email|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_feedback_email">{$LANG.admin_feedback_email} :</label><br />
    <input type="email" name="admin_feedback_email" id="admin_feedback_email" value="{$smarty.session.val.admin_feedback_email|escape}" required="required" /></p>

    <p><span class="mandatory">*</span> <label for="admin_return_email">{$LANG.admin_return_email} :</label><br />
    <input type="email" name="admin_return_email" id="admin_return_email" value="{$smarty.session.val.admin_return_email|escape}" required="required" /></p>

    <p><button type="submit" name="config_site_submit" class="btn btn-primary btn-lg">{$LANG.next}</button></p>

</form>

{include file="inc/footer.tpl"}
