--
-- Copyright (c) 2008 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
-- 
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation. 
--
--
--
--

create table
rhnKickstartPackage
(
	kickstart_id		numeric
				not null
				constraint rhn_kspackage_ksid_fk
				references rhnKSData(id)
				on delete cascade,
	package_name_id		numeric
				not null
				constraint rhn_kspackage_pnid_fk
				references rhnPackageName(id),
                    position    numeric not null,
	created			date default(current_date)
				not null,
	modified		date default(current_date)
				not null
)
  ;

create index rhn_kspackage_id_idx
	on rhnKickstartPackage( kickstart_id )
--	tablespace [[4m_tbs]]
  ;
/*
create or replace trigger
rhn_kspackage_mod_trig
before insert or update on rhnKickstartPackage
for each row
begin
	:new.modified := sysdate;
end;
/
show errors
*/
--
--
-- Revision 1.2  2003/09/17 16:45:37  rnorwood
-- bugzilla: 103307 - rename rhnKickstart due to extreme weirdness with Oracle::DBD.
--
-- Revision 1.1  2003/09/11 20:55:42  pjones
-- bugzilla: 104231
--
-- tables to handle kickstart data
--
