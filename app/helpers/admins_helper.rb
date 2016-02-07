module AdminsHelper
	def tinymce_init
		content_for :extra_js do
			"setTimeout(function() {
				if (!$('.tinymce').prev().is('.mce-panel')) window.location.reload();
			}, 500);".html_safe
		end
		'<script>
			//<![CDATA[
			tinyMCE.init({
				selector: "textarea.tinymce",
				toolbar: "bold italic | undo redo | link",
				menubar: false,
				statusbar: false,
				forced_root_block: false,
				plugins: "link"
			});
			//]]>
		</script>'.html_safe
	end
end
