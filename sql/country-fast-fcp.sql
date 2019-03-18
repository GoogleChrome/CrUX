#standardSQL
# Create a `countries` alias that annotates each country's data with the corresponding country name and country code.
# This query consumes 65.6 GB.
WITH
  countries AS (
  SELECT *, 'ad' AS country_code, 'Andorra' AS country FROM `chrome-ux-report.country_ad.201808` UNION ALL
  SELECT *, 'ae' AS country_code, 'United Arab Emirates' AS country FROM `chrome-ux-report.country_ae.201808` UNION ALL
  SELECT *, 'af' AS country_code, 'Afghanistan' AS country FROM `chrome-ux-report.country_af.201808` UNION ALL
  SELECT *, 'ag' AS country_code, 'Antigua and Barbuda' AS country FROM `chrome-ux-report.country_ag.201808` UNION ALL
  SELECT *, 'ai' AS country_code, 'Anguilla' AS country FROM `chrome-ux-report.country_ai.201808` UNION ALL
  SELECT *, 'al' AS country_code, 'Albania' AS country FROM `chrome-ux-report.country_al.201808` UNION ALL
  SELECT *, 'am' AS country_code, 'Armenia' AS country FROM `chrome-ux-report.country_am.201808` UNION ALL
  SELECT *, 'ao' AS country_code, 'Angola' AS country FROM `chrome-ux-report.country_ao.201808` UNION ALL
  SELECT *, 'ar' AS country_code, 'Argentina' AS country FROM `chrome-ux-report.country_ar.201808` UNION ALL
  SELECT *, 'as' AS country_code, 'American Samoa' AS country FROM `chrome-ux-report.country_as.201808` UNION ALL
  SELECT *, 'at' AS country_code, 'Austria' AS country FROM `chrome-ux-report.country_at.201808` UNION ALL
  SELECT *, 'au' AS country_code, 'Australia' AS country FROM `chrome-ux-report.country_au.201808` UNION ALL
  SELECT *, 'aw' AS country_code, 'Aruba' AS country FROM `chrome-ux-report.country_aw.201808` UNION ALL
  SELECT *, 'ax' AS country_code, 'Åland Islands' AS country FROM `chrome-ux-report.country_ax.201808` UNION ALL
  SELECT *, 'az' AS country_code, 'Azerbaijan' AS country FROM `chrome-ux-report.country_az.201808` UNION ALL
  SELECT *, 'ba' AS country_code, 'Bosnia and Herzegovina' AS country FROM `chrome-ux-report.country_ba.201808` UNION ALL
  SELECT *, 'bb' AS country_code, 'Barbados' AS country FROM `chrome-ux-report.country_bb.201808` UNION ALL
  SELECT *, 'bd' AS country_code, 'Bangladesh' AS country FROM `chrome-ux-report.country_bd.201808` UNION ALL
  SELECT *, 'be' AS country_code, 'Belgium' AS country FROM `chrome-ux-report.country_be.201808` UNION ALL
  SELECT *, 'bf' AS country_code, 'Burkina Faso' AS country FROM `chrome-ux-report.country_bf.201808` UNION ALL
  SELECT *, 'bg' AS country_code, 'Bulgaria' AS country FROM `chrome-ux-report.country_bg.201808` UNION ALL
  SELECT *, 'bh' AS country_code, 'Bahrain' AS country FROM `chrome-ux-report.country_bh.201808` UNION ALL
  SELECT *, 'bi' AS country_code, 'Burundi' AS country FROM `chrome-ux-report.country_bi.201808` UNION ALL
  SELECT *, 'bj' AS country_code, 'Benin' AS country FROM `chrome-ux-report.country_bj.201808` UNION ALL
  SELECT *, 'bl' AS country_code, 'Saint Barthélemy' AS country FROM `chrome-ux-report.country_bl.201808` UNION ALL
  SELECT *, 'bm' AS country_code, 'Bermuda' AS country FROM `chrome-ux-report.country_bm.201808` UNION ALL
  SELECT *, 'bn' AS country_code, 'Brunei Darussalam' AS country FROM `chrome-ux-report.country_bn.201808` UNION ALL
  SELECT *, 'bo' AS country_code, 'Bolivia (Plurinational State of)' AS country FROM `chrome-ux-report.country_bo.201808` UNION ALL
  SELECT *, 'bq' AS country_code, 'Bonaire, Sint Eustatius and Saba' AS country FROM `chrome-ux-report.country_bq.201808` UNION ALL
  SELECT *, 'br' AS country_code, 'Brazil' AS country FROM `chrome-ux-report.country_br.201808` UNION ALL
  SELECT *, 'bs' AS country_code, 'Bahamas' AS country FROM `chrome-ux-report.country_bs.201808` UNION ALL
  SELECT *, 'bt' AS country_code, 'Bhutan' AS country FROM `chrome-ux-report.country_bt.201808` UNION ALL
  SELECT *, 'bw' AS country_code, 'Botswana' AS country FROM `chrome-ux-report.country_bw.201808` UNION ALL
  SELECT *, 'by' AS country_code, 'Belarus' AS country FROM `chrome-ux-report.country_by.201808` UNION ALL
  SELECT *, 'bz' AS country_code, 'Belize' AS country FROM `chrome-ux-report.country_bz.201808` UNION ALL
  SELECT *, 'ca' AS country_code, 'Canada' AS country FROM `chrome-ux-report.country_ca.201808` UNION ALL
  SELECT *, 'cd' AS country_code, 'Congo (Democratic Republic of the)' AS country FROM `chrome-ux-report.country_cd.201808` UNION ALL
  SELECT *, 'cf' AS country_code, 'Central African Republic' AS country FROM `chrome-ux-report.country_cf.201808` UNION ALL
  SELECT *, 'cg' AS country_code, 'Congo' AS country FROM `chrome-ux-report.country_cg.201808` UNION ALL
  SELECT *, 'ch' AS country_code, 'Switzerland' AS country FROM `chrome-ux-report.country_ch.201808` UNION ALL
  SELECT *, 'ci' AS country_code, 'Côte d\'Ivoire' AS country FROM `chrome-ux-report.country_ci.201808` UNION ALL
  SELECT *, 'ck' AS country_code, 'Cook Islands' AS country FROM `chrome-ux-report.country_ck.201808` UNION ALL
  SELECT *, 'cl' AS country_code, 'Chile' AS country FROM `chrome-ux-report.country_cl.201808` UNION ALL
  SELECT *, 'cm' AS country_code, 'Cameroon' AS country FROM `chrome-ux-report.country_cm.201808` UNION ALL
  SELECT *, 'cn' AS country_code, 'China' AS country FROM `chrome-ux-report.country_cn.201808` UNION ALL
  SELECT *, 'co' AS country_code, 'Colombia' AS country FROM `chrome-ux-report.country_co.201808` UNION ALL
  SELECT *, 'cr' AS country_code, 'Costa Rica' AS country FROM `chrome-ux-report.country_cr.201808` UNION ALL
  SELECT *, 'cu' AS country_code, 'Cuba' AS country FROM `chrome-ux-report.country_cu.201808` UNION ALL
  SELECT *, 'cv' AS country_code, 'Cabo Verde' AS country FROM `chrome-ux-report.country_cv.201808` UNION ALL
  SELECT *, 'cw' AS country_code, 'Curaçao' AS country FROM `chrome-ux-report.country_cw.201808` UNION ALL
  SELECT *, 'cx' AS country_code, 'Christmas Island' AS country FROM `chrome-ux-report.country_cx.201808` UNION ALL
  SELECT *, 'cy' AS country_code, 'Cyprus' AS country FROM `chrome-ux-report.country_cy.201808` UNION ALL
  SELECT *, 'cz' AS country_code, 'Czech Republic' AS country FROM `chrome-ux-report.country_cz.201808` UNION ALL
  SELECT *, 'de' AS country_code, 'Germany' AS country FROM `chrome-ux-report.country_de.201808` UNION ALL
  SELECT *, 'dj' AS country_code, 'Djibouti' AS country FROM `chrome-ux-report.country_dj.201808` UNION ALL
  SELECT *, 'dk' AS country_code, 'Denmark' AS country FROM `chrome-ux-report.country_dk.201808` UNION ALL
  SELECT *, 'dm' AS country_code, 'Dominica' AS country FROM `chrome-ux-report.country_dm.201808` UNION ALL
  SELECT *, 'do' AS country_code, 'Dominican Republic' AS country FROM `chrome-ux-report.country_do.201808` UNION ALL
  SELECT *, 'dz' AS country_code, 'Algeria' AS country FROM `chrome-ux-report.country_dz.201808` UNION ALL
  SELECT *, 'ec' AS country_code, 'Ecuador' AS country FROM `chrome-ux-report.country_ec.201808` UNION ALL
  SELECT *, 'ee' AS country_code, 'Estonia' AS country FROM `chrome-ux-report.country_ee.201808` UNION ALL
  SELECT *, 'eg' AS country_code, 'Egypt' AS country FROM `chrome-ux-report.country_eg.201808` UNION ALL
  SELECT *, 'eh' AS country_code, 'Western Sahara' AS country FROM `chrome-ux-report.country_eh.201808` UNION ALL
  SELECT *, 'er' AS country_code, 'Eritrea' AS country FROM `chrome-ux-report.country_er.201808` UNION ALL
  SELECT *, 'es' AS country_code, 'Spain' AS country FROM `chrome-ux-report.country_es.201808` UNION ALL
  SELECT *, 'et' AS country_code, 'Ethiopia' AS country FROM `chrome-ux-report.country_et.201808` UNION ALL
  SELECT *, 'fi' AS country_code, 'Finland' AS country FROM `chrome-ux-report.country_fi.201808` UNION ALL
  SELECT *, 'fj' AS country_code, 'Fiji' AS country FROM `chrome-ux-report.country_fj.201808` UNION ALL
  SELECT *, 'fk' AS country_code, 'Falkland Islands (Malvinas)' AS country FROM `chrome-ux-report.country_fk.201808` UNION ALL
  SELECT *, 'fm' AS country_code, 'Micronesia (Federated States of)' AS country FROM `chrome-ux-report.country_fm.201808` UNION ALL
  SELECT *, 'fo' AS country_code, 'Faroe Islands' AS country FROM `chrome-ux-report.country_fo.201808` UNION ALL
  SELECT *, 'fr' AS country_code, 'France' AS country FROM `chrome-ux-report.country_fr.201808` UNION ALL
  SELECT *, 'ga' AS country_code, 'Gabon' AS country FROM `chrome-ux-report.country_ga.201808` UNION ALL
  SELECT *, 'gb' AS country_code, 'United Kingdom of Great Britain and Northern Ireland' AS country FROM `chrome-ux-report.country_gb.201808` UNION ALL
  SELECT *, 'gd' AS country_code, 'Grenada' AS country FROM `chrome-ux-report.country_gd.201808` UNION ALL
  SELECT *, 'ge' AS country_code, 'Georgia' AS country FROM `chrome-ux-report.country_ge.201808` UNION ALL
  SELECT *, 'gf' AS country_code, 'French Guiana' AS country FROM `chrome-ux-report.country_gf.201808` UNION ALL
  SELECT *, 'gg' AS country_code, 'Guernsey' AS country FROM `chrome-ux-report.country_gg.201808` UNION ALL
  SELECT *, 'gh' AS country_code, 'Ghana' AS country FROM `chrome-ux-report.country_gh.201808` UNION ALL
  SELECT *, 'gi' AS country_code, 'Gibraltar' AS country FROM `chrome-ux-report.country_gi.201808` UNION ALL
  SELECT *, 'gl' AS country_code, 'Greenland' AS country FROM `chrome-ux-report.country_gl.201808` UNION ALL
  SELECT *, 'gm' AS country_code, 'Gambia' AS country FROM `chrome-ux-report.country_gm.201808` UNION ALL
  SELECT *, 'gn' AS country_code, 'Guinea' AS country FROM `chrome-ux-report.country_gn.201808` UNION ALL
  SELECT *, 'gp' AS country_code, 'Guadeloupe' AS country FROM `chrome-ux-report.country_gp.201808` UNION ALL
  SELECT *, 'gq' AS country_code, 'Equatorial Guinea' AS country FROM `chrome-ux-report.country_gq.201808` UNION ALL
  SELECT *, 'gr' AS country_code, 'Greece' AS country FROM `chrome-ux-report.country_gr.201808` UNION ALL
  SELECT *, 'gt' AS country_code, 'Guatemala' AS country FROM `chrome-ux-report.country_gt.201808` UNION ALL
  SELECT *, 'gu' AS country_code, 'Guam' AS country FROM `chrome-ux-report.country_gu.201808` UNION ALL
  SELECT *, 'gw' AS country_code, 'Guinea-Bissau' AS country FROM `chrome-ux-report.country_gw.201808` UNION ALL
  SELECT *, 'gy' AS country_code, 'Guyana' AS country FROM `chrome-ux-report.country_gy.201808` UNION ALL
  SELECT *, 'hk' AS country_code, 'Hong Kong' AS country FROM `chrome-ux-report.country_hk.201808` UNION ALL
  SELECT *, 'hn' AS country_code, 'Honduras' AS country FROM `chrome-ux-report.country_hn.201808` UNION ALL
  SELECT *, 'hr' AS country_code, 'Croatia' AS country FROM `chrome-ux-report.country_hr.201808` UNION ALL
  SELECT *, 'ht' AS country_code, 'Haiti' AS country FROM `chrome-ux-report.country_ht.201808` UNION ALL
  SELECT *, 'hu' AS country_code, 'Hungary' AS country FROM `chrome-ux-report.country_hu.201808` UNION ALL
  SELECT *, 'id' AS country_code, 'Indonesia' AS country FROM `chrome-ux-report.country_id.201808` UNION ALL
  SELECT *, 'ie' AS country_code, 'Ireland' AS country FROM `chrome-ux-report.country_ie.201808` UNION ALL
  SELECT *, 'il' AS country_code, 'Israel' AS country FROM `chrome-ux-report.country_il.201808` UNION ALL
  SELECT *, 'im' AS country_code, 'Isle of Man' AS country FROM `chrome-ux-report.country_im.201808` UNION ALL
  SELECT *, 'in' AS country_code, 'India' AS country FROM `chrome-ux-report.country_in.201808` UNION ALL
  SELECT *, 'io' AS country_code, 'British Indian Ocean Territory' AS country FROM `chrome-ux-report.country_io.201808` UNION ALL
  SELECT *, 'iq' AS country_code, 'Iraq' AS country FROM `chrome-ux-report.country_iq.201808` UNION ALL
  SELECT *, 'ir' AS country_code, 'Iran (Islamic Republic of)' AS country FROM `chrome-ux-report.country_ir.201808` UNION ALL
  SELECT *, 'is' AS country_code, 'Iceland' AS country FROM `chrome-ux-report.country_is.201808` UNION ALL
  SELECT *, 'it' AS country_code, 'Italy' AS country FROM `chrome-ux-report.country_it.201808` UNION ALL
  SELECT *, 'je' AS country_code, 'Jersey' AS country FROM `chrome-ux-report.country_je.201808` UNION ALL
  SELECT *, 'jm' AS country_code, 'Jamaica' AS country FROM `chrome-ux-report.country_jm.201808` UNION ALL
  SELECT *, 'jo' AS country_code, 'Jordan' AS country FROM `chrome-ux-report.country_jo.201808` UNION ALL
  SELECT *, 'jp' AS country_code, 'Japan' AS country FROM `chrome-ux-report.country_jp.201808` UNION ALL
  SELECT *, 'ke' AS country_code, 'Kenya' AS country FROM `chrome-ux-report.country_ke.201808` UNION ALL
  SELECT *, 'kg' AS country_code, 'Kyrgyzstan' AS country FROM `chrome-ux-report.country_kg.201808` UNION ALL
  SELECT *, 'kh' AS country_code, 'Cambodia' AS country FROM `chrome-ux-report.country_kh.201808` UNION ALL
  SELECT *, 'ki' AS country_code, 'Kiribati' AS country FROM `chrome-ux-report.country_ki.201808` UNION ALL
  SELECT *, 'km' AS country_code, 'Comoros' AS country FROM `chrome-ux-report.country_km.201808` UNION ALL
  SELECT *, 'kn' AS country_code, 'Saint Kitts and Nevis' AS country FROM `chrome-ux-report.country_kn.201808` UNION ALL
  SELECT *, 'kp' AS country_code, 'Korea (Democratic People\'s Republic of)' AS country FROM `chrome-ux-report.country_kp.201808` UNION ALL
  SELECT *, 'kr' AS country_code, 'Korea (Republic of)' AS country FROM `chrome-ux-report.country_kr.201808` UNION ALL
  SELECT *, 'kw' AS country_code, 'Kuwait' AS country FROM `chrome-ux-report.country_kw.201808` UNION ALL
  SELECT *, 'ky' AS country_code, 'Cayman Islands' AS country FROM `chrome-ux-report.country_ky.201808` UNION ALL
  SELECT *, 'kz' AS country_code, 'Kazakhstan' AS country FROM `chrome-ux-report.country_kz.201808` UNION ALL
  SELECT *, 'la' AS country_code, 'Lao People\'s Democratic Republic' AS country FROM `chrome-ux-report.country_la.201808` UNION ALL
  SELECT *, 'lb' AS country_code, 'Lebanon' AS country FROM `chrome-ux-report.country_lb.201808` UNION ALL
  SELECT *, 'lc' AS country_code, 'Saint Lucia' AS country FROM `chrome-ux-report.country_lc.201808` UNION ALL
  SELECT *, 'li' AS country_code, 'Liechtenstein' AS country FROM `chrome-ux-report.country_li.201808` UNION ALL
  SELECT *, 'lk' AS country_code, 'Sri Lanka' AS country FROM `chrome-ux-report.country_lk.201808` UNION ALL
  SELECT *, 'lr' AS country_code, 'Liberia' AS country FROM `chrome-ux-report.country_lr.201808` UNION ALL
  SELECT *, 'ls' AS country_code, 'Lesotho' AS country FROM `chrome-ux-report.country_ls.201808` UNION ALL
  SELECT *, 'lt' AS country_code, 'Lithuania' AS country FROM `chrome-ux-report.country_lt.201808` UNION ALL
  SELECT *, 'lu' AS country_code, 'Luxembourg' AS country FROM `chrome-ux-report.country_lu.201808` UNION ALL
  SELECT *, 'lv' AS country_code, 'Latvia' AS country FROM `chrome-ux-report.country_lv.201808` UNION ALL
  SELECT *, 'ly' AS country_code, 'Libya' AS country FROM `chrome-ux-report.country_ly.201808` UNION ALL
  SELECT *, 'ma' AS country_code, 'Morocco' AS country FROM `chrome-ux-report.country_ma.201808` UNION ALL
  SELECT *, 'mc' AS country_code, 'Monaco' AS country FROM `chrome-ux-report.country_mc.201808` UNION ALL
  SELECT *, 'md' AS country_code, 'Moldova (Republic of)' AS country FROM `chrome-ux-report.country_md.201808` UNION ALL
  SELECT *, 'me' AS country_code, 'Montenegro' AS country FROM `chrome-ux-report.country_me.201808` UNION ALL
  SELECT *, 'mf' AS country_code, 'Saint Martin (French part)' AS country FROM `chrome-ux-report.country_mf.201808` UNION ALL
  SELECT *, 'mg' AS country_code, 'Madagascar' AS country FROM `chrome-ux-report.country_mg.201808` UNION ALL
  SELECT *, 'mh' AS country_code, 'Marshall Islands' AS country FROM `chrome-ux-report.country_mh.201808` UNION ALL
  SELECT *, 'mk' AS country_code, 'Macedonia (the former Yugoslav Republic of)' AS country FROM `chrome-ux-report.country_mk.201808` UNION ALL
  SELECT *, 'ml' AS country_code, 'Mali' AS country FROM `chrome-ux-report.country_ml.201808` UNION ALL
  SELECT *, 'mm' AS country_code, 'Myanmar' AS country FROM `chrome-ux-report.country_mm.201808` UNION ALL
  SELECT *, 'mn' AS country_code, 'Mongolia' AS country FROM `chrome-ux-report.country_mn.201808` UNION ALL
  SELECT *, 'mo' AS country_code, 'Macao' AS country FROM `chrome-ux-report.country_mo.201808` UNION ALL
  SELECT *, 'mp' AS country_code, 'Northern Mariana Islands' AS country FROM `chrome-ux-report.country_mp.201808` UNION ALL
  SELECT *, 'mq' AS country_code, 'Martinique' AS country FROM `chrome-ux-report.country_mq.201808` UNION ALL
  SELECT *, 'mr' AS country_code, 'Mauritania' AS country FROM `chrome-ux-report.country_mr.201808` UNION ALL
  SELECT *, 'ms' AS country_code, 'Montserrat' AS country FROM `chrome-ux-report.country_ms.201808` UNION ALL
  SELECT *, 'mt' AS country_code, 'Malta' AS country FROM `chrome-ux-report.country_mt.201808` UNION ALL
  SELECT *, 'mu' AS country_code, 'Mauritius' AS country FROM `chrome-ux-report.country_mu.201808` UNION ALL
  SELECT *, 'mv' AS country_code, 'Maldives' AS country FROM `chrome-ux-report.country_mv.201808` UNION ALL
  SELECT *, 'mw' AS country_code, 'Malawi' AS country FROM `chrome-ux-report.country_mw.201808` UNION ALL
  SELECT *, 'mx' AS country_code, 'Mexico' AS country FROM `chrome-ux-report.country_mx.201808` UNION ALL
  SELECT *, 'my' AS country_code, 'Malaysia' AS country FROM `chrome-ux-report.country_my.201808` UNION ALL
  SELECT *, 'mz' AS country_code, 'Mozambique' AS country FROM `chrome-ux-report.country_mz.201808` UNION ALL
  SELECT *, 'na' AS country_code, 'Namibia' AS country FROM `chrome-ux-report.country_na.201808` UNION ALL
  SELECT *, 'nc' AS country_code, 'New Caledonia' AS country FROM `chrome-ux-report.country_nc.201808` UNION ALL
  SELECT *, 'ne' AS country_code, 'Niger' AS country FROM `chrome-ux-report.country_ne.201808` UNION ALL
  SELECT *, 'nf' AS country_code, 'Norfolk Island' AS country FROM `chrome-ux-report.country_nf.201808` UNION ALL
  SELECT *, 'ng' AS country_code, 'Nigeria' AS country FROM `chrome-ux-report.country_ng.201808` UNION ALL
  SELECT *, 'ni' AS country_code, 'Nicaragua' AS country FROM `chrome-ux-report.country_ni.201808` UNION ALL
  SELECT *, 'nl' AS country_code, 'Netherlands' AS country FROM `chrome-ux-report.country_nl.201808` UNION ALL
  SELECT *, 'no' AS country_code, 'Norway' AS country FROM `chrome-ux-report.country_no.201808` UNION ALL
  SELECT *, 'np' AS country_code, 'Nepal' AS country FROM `chrome-ux-report.country_np.201808` UNION ALL
  SELECT *, 'nr' AS country_code, 'Nauru' AS country FROM `chrome-ux-report.country_nr.201808` UNION ALL
  SELECT *, 'nz' AS country_code, 'New Zealand' AS country FROM `chrome-ux-report.country_nz.201808` UNION ALL
  SELECT *, 'om' AS country_code, 'Oman' AS country FROM `chrome-ux-report.country_om.201808` UNION ALL
  SELECT *, 'pa' AS country_code, 'Panama' AS country FROM `chrome-ux-report.country_pa.201808` UNION ALL
  SELECT *, 'pe' AS country_code, 'Peru' AS country FROM `chrome-ux-report.country_pe.201808` UNION ALL
  SELECT *, 'pf' AS country_code, 'French Polynesia' AS country FROM `chrome-ux-report.country_pf.201808` UNION ALL
  SELECT *, 'pg' AS country_code, 'Papua New Guinea' AS country FROM `chrome-ux-report.country_pg.201808` UNION ALL
  SELECT *, 'ph' AS country_code, 'Philippines' AS country FROM `chrome-ux-report.country_ph.201808` UNION ALL
  SELECT *, 'pk' AS country_code, 'Pakistan' AS country FROM `chrome-ux-report.country_pk.201808` UNION ALL
  SELECT *, 'pl' AS country_code, 'Poland' AS country FROM `chrome-ux-report.country_pl.201808` UNION ALL
  SELECT *, 'pm' AS country_code, 'Saint Pierre and Miquelon' AS country FROM `chrome-ux-report.country_pm.201808` UNION ALL
  SELECT *, 'pr' AS country_code, 'Puerto Rico' AS country FROM `chrome-ux-report.country_pr.201808` UNION ALL
  SELECT *, 'ps' AS country_code, 'Palestine, State of' AS country FROM `chrome-ux-report.country_ps.201808` UNION ALL
  SELECT *, 'pt' AS country_code, 'Portugal' AS country FROM `chrome-ux-report.country_pt.201808` UNION ALL
  SELECT *, 'pw' AS country_code, 'Palau' AS country FROM `chrome-ux-report.country_pw.201808` UNION ALL
  SELECT *, 'py' AS country_code, 'Paraguay' AS country FROM `chrome-ux-report.country_py.201808` UNION ALL
  SELECT *, 'qa' AS country_code, 'Qatar' AS country FROM `chrome-ux-report.country_qa.201808` UNION ALL
  SELECT *, 're' AS country_code, 'Réunion' AS country FROM `chrome-ux-report.country_re.201808` UNION ALL
  SELECT *, 'ro' AS country_code, 'Romania' AS country FROM `chrome-ux-report.country_ro.201808` UNION ALL
  SELECT *, 'rs' AS country_code, 'Serbia' AS country FROM `chrome-ux-report.country_rs.201808` UNION ALL
  SELECT *, 'ru' AS country_code, 'Russian Federation' AS country FROM `chrome-ux-report.country_ru.201808` UNION ALL
  SELECT *, 'rw' AS country_code, 'Rwanda' AS country FROM `chrome-ux-report.country_rw.201808` UNION ALL
  SELECT *, 'sa' AS country_code, 'Saudi Arabia' AS country FROM `chrome-ux-report.country_sa.201808` UNION ALL
  SELECT *, 'sb' AS country_code, 'Solomon Islands' AS country FROM `chrome-ux-report.country_sb.201808` UNION ALL
  SELECT *, 'sc' AS country_code, 'Seychelles' AS country FROM `chrome-ux-report.country_sc.201808` UNION ALL
  SELECT *, 'sd' AS country_code, 'Sudan' AS country FROM `chrome-ux-report.country_sd.201808` UNION ALL
  SELECT *, 'se' AS country_code, 'Sweden' AS country FROM `chrome-ux-report.country_se.201808` UNION ALL
  SELECT *, 'sg' AS country_code, 'Singapore' AS country FROM `chrome-ux-report.country_sg.201808` UNION ALL
  SELECT *, 'sh' AS country_code, 'Saint Helena, Ascension and Tristan da Cunha' AS country FROM `chrome-ux-report.country_sh.201808` UNION ALL
  SELECT *, 'si' AS country_code, 'Slovenia' AS country FROM `chrome-ux-report.country_si.201808` UNION ALL
  SELECT *, 'sj' AS country_code, 'Svalbard and Jan Mayen' AS country FROM `chrome-ux-report.country_sj.201808` UNION ALL
  SELECT *, 'sk' AS country_code, 'Slovakia' AS country FROM `chrome-ux-report.country_sk.201808` UNION ALL
  SELECT *, 'sl' AS country_code, 'Sierra Leone' AS country FROM `chrome-ux-report.country_sl.201808` UNION ALL
  SELECT *, 'sm' AS country_code, 'San Marino' AS country FROM `chrome-ux-report.country_sm.201808` UNION ALL
  SELECT *, 'sn' AS country_code, 'Senegal' AS country FROM `chrome-ux-report.country_sn.201808` UNION ALL
  SELECT *, 'so' AS country_code, 'Somalia' AS country FROM `chrome-ux-report.country_so.201808` UNION ALL
  SELECT *, 'sr' AS country_code, 'Suriname' AS country FROM `chrome-ux-report.country_sr.201808` UNION ALL
  SELECT *, 'ss' AS country_code, 'South Sudan' AS country FROM `chrome-ux-report.country_ss.201808` UNION ALL
  SELECT *, 'st' AS country_code, 'Sao Tome and Principe' AS country FROM `chrome-ux-report.country_st.201808` UNION ALL
  SELECT *, 'sv' AS country_code, 'El Salvador' AS country FROM `chrome-ux-report.country_sv.201808` UNION ALL
  SELECT *, 'sx' AS country_code, 'Sint Maarten (Dutch part)' AS country FROM `chrome-ux-report.country_sx.201808` UNION ALL
  SELECT *, 'sy' AS country_code, 'Syrian Arab Republic' AS country FROM `chrome-ux-report.country_sy.201808` UNION ALL
  SELECT *, 'sz' AS country_code, 'Swaziland' AS country FROM `chrome-ux-report.country_sz.201808` UNION ALL
  SELECT *, 'tc' AS country_code, 'Turks and Caicos Islands' AS country FROM `chrome-ux-report.country_tc.201808` UNION ALL
  SELECT *, 'td' AS country_code, 'Chad' AS country FROM `chrome-ux-report.country_td.201808` UNION ALL
  SELECT *, 'tg' AS country_code, 'Togo' AS country FROM `chrome-ux-report.country_tg.201808` UNION ALL
  SELECT *, 'th' AS country_code, 'Thailand' AS country FROM `chrome-ux-report.country_th.201808` UNION ALL
  SELECT *, 'tj' AS country_code, 'Tajikistan' AS country FROM `chrome-ux-report.country_tj.201808` UNION ALL
  SELECT *, 'tl' AS country_code, 'Timor-Leste' AS country FROM `chrome-ux-report.country_tl.201808` UNION ALL
  SELECT *, 'tm' AS country_code, 'Turkmenistan' AS country FROM `chrome-ux-report.country_tm.201808` UNION ALL
  SELECT *, 'tn' AS country_code, 'Tunisia' AS country FROM `chrome-ux-report.country_tn.201808` UNION ALL
  SELECT *, 'to' AS country_code, 'Tonga' AS country FROM `chrome-ux-report.country_to.201808` UNION ALL
  SELECT *, 'tr' AS country_code, 'Turkey' AS country FROM `chrome-ux-report.country_tr.201808` UNION ALL
  SELECT *, 'tt' AS country_code, 'Trinidad and Tobago' AS country FROM `chrome-ux-report.country_tt.201808` UNION ALL
  SELECT *, 'tv' AS country_code, 'Tuvalu' AS country FROM `chrome-ux-report.country_tv.201808` UNION ALL
  SELECT *, 'tw' AS country_code, 'Taiwan, Province of China' AS country FROM `chrome-ux-report.country_tw.201808` UNION ALL
  SELECT *, 'tz' AS country_code, 'Tanzania, United Republic of' AS country FROM `chrome-ux-report.country_tz.201808` UNION ALL
  SELECT *, 'ua' AS country_code, 'Ukraine' AS country FROM `chrome-ux-report.country_ua.201808` UNION ALL
  SELECT *, 'ug' AS country_code, 'Uganda' AS country FROM `chrome-ux-report.country_ug.201808` UNION ALL
  SELECT *, 'us' AS country_code, 'United States of America' AS country FROM `chrome-ux-report.country_us.201808` UNION ALL
  SELECT *, 'uy' AS country_code, 'Uruguay' AS country FROM `chrome-ux-report.country_uy.201808` UNION ALL
  SELECT *, 'uz' AS country_code, 'Uzbekistan' AS country FROM `chrome-ux-report.country_uz.201808` UNION ALL
  SELECT *, 'vc' AS country_code, 'Saint Vincent and the Grenadines' AS country FROM `chrome-ux-report.country_vc.201808` UNION ALL
  SELECT *, 've' AS country_code, 'Venezuela (Bolivarian Republic of)' AS country FROM `chrome-ux-report.country_ve.201808` UNION ALL
  SELECT *, 'vg' AS country_code, 'Virgin Islands (British)' AS country FROM `chrome-ux-report.country_vg.201808` UNION ALL
  SELECT *, 'vi' AS country_code, 'Virgin Islands (U.S.)' AS country FROM `chrome-ux-report.country_vi.201808` UNION ALL
  SELECT *, 'vn' AS country_code, 'Viet Nam' AS country FROM `chrome-ux-report.country_vn.201808` UNION ALL
  SELECT *, 'vu' AS country_code, 'Vanuatu' AS country FROM `chrome-ux-report.country_vu.201808` UNION ALL
  SELECT *, 'ws' AS country_code, 'Samoa' AS country FROM `chrome-ux-report.country_ws.201808` UNION ALL
  SELECT *, 'xk' AS country_code, 'Kosovo' AS country FROM `chrome-ux-report.country_xk.201808` UNION ALL
  SELECT *, 'ye' AS country_code, 'Yemen' AS country FROM `chrome-ux-report.country_ye.201808` UNION ALL
  SELECT *, 'yt' AS country_code, 'Mayotte' AS country FROM `chrome-ux-report.country_yt.201808` UNION ALL
  SELECT *, 'za' AS country_code, 'South Africa' AS country FROM `chrome-ux-report.country_za.201808` UNION ALL
  SELECT *, 'zm' AS country_code, 'Zambia' AS country FROM `chrome-ux-report.country_zm.201808` UNION ALL
  SELECT *, 'zw' AS country_code, 'Zimbabwe' AS country FROM `chrome-ux-report.country_zw.201808`
)

# Compute the fast FCP densities of a particular origin for each country.
# Note that this origin may not be available in some countries.
SELECT
  country,
  country_code,
  ROUND(SUM(IF(fcp.start < 1000, fcp.density, 0)), 4) AS fast_fcp
FROM
  countries,
  UNNEST(first_contentful_paint.histogram.bin) AS fcp
WHERE
  origin = 'https://developers.google.com'
GROUP BY
  country,
  country_code
ORDER BY
  country_code
