select xt.add_column('source', 'source_docass_num','INTEGER', 'NOT NULL DEFAULT 0',    'public');
select xt.add_column('source', 'source_docass',       'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_charass',      'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_table',        'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_key_field',    'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_number_field', 'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_name_field',   'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_desc_field',   'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_widget',       'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_joins',        'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_key_param',    'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_uiform_name',  'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_create_priv',  'TEXT', $$NOT NULL DEFAULT ''$$, 'public');
select xt.add_column('source', 'source_created',      'TIMESTAMP WITH TIME ZONE', 'NOT NULL DEFAULT CURRENT_TIMESTAMP', 'public');
select xt.add_column('source', 'source_last_modified','TIMESTAMP WITH TIME ZONE', 'NOT NULL DEFAULT CURRENT_TIMESTAMP', 'public');

COMMENT ON TABLE  public.source IS 'Used to describe different types of document for tax classes, document associations, comment associations, and characteristic associations';
COMMENT ON COLUMN public.source.source_name IS 'Abbreviation for this document type used on comment associations.';
COMMENT ON COLUMN public.source.source_docass IS 'Abbreviation for this document type used on document associations (docass). Empty indicates cannot used for document associations (see source_widget).';
COMMENT ON COLUMN public.source.source_charass IS 'Abbreviation for this document type used on characteristic associations (charass). Empty indicates not used for characteristics.';
COMMENT ON COLUMN public.source.source_descrip IS 'Human-readable English name for this document type. The client application tries to translate this whenever possible.';

COMMENT ON COLUMN public.source.source_docass_num IS 'Value from the desktop client''s Document::DocumentSources enumeration corresponding to this document type.';
COMMENT ON COLUMN public.source.source_table IS 'The primary table in which this document is stored.';
COMMENT ON COLUMN public.source.source_key_field IS 'The primary key field in the primary table for this document type.';
COMMENT ON COLUMN public.source.source_number_field IS 'The column holding the main human-readable identifier for this document (e.g. Bill of Materials document number).';
COMMENT ON COLUMN public.source.source_name_field IS 'The column holding the secondary description of this document (e.g. the Item built by a Bill of Materials).';
COMMENT ON COLUMN public.source.source_desc_field IS 'The column holding the longer description of this document (e.g. the first line of the Item''s Description for a Bill of Materials).';
COMMENT ON COLUMN public.source.source_widget IS 'A hint to the client application of how to let the user select a document to attach. "core" means that the C++ application handles this document type natively. A value starting with "SELECT" is interpreted as a query to populate a combobox, while values containing "Cluster" are treated as the name of a C++ VirtualCluster subclass to instantiate. Empty string means this cannot be used by the desktop client to create document associations (see source_docass).';
COMMENT ON COLUMN public.source.source_joins IS 'An optional string to add to the FROM clause to get auxiliary information (e.g. "join item_id on bomhead_item_id=item_id").';
COMMENT ON COLUMN public.source.source_key_param IS 'The name of the parameter interpreted by the desktop client''s "set" method as containing the primary key to retrieve the main document record for editing or viewing (e.g. most desktop windows take the sales order id in a "sohead_id" parameter even though the database field is "cohead_id").';
COMMENT ON COLUMN public.source.source_uiform_name IS 'The name of the desktop client application window to open to view or edit this document (e.g. "salesOrder").';
COMMENT ON COLUMN public.source.source_create_priv IS 'A space- or +-delimited set of privileges required to allow creating a new document. If this is specified, an item will be added to the desktop client''s "New" button menu.';
COMMENT ON COLUMN public.source.source_created IS 'The date this source record was created (or the date this column was added to the table:-).';
COMMENT ON COLUMN public.source.source_last_modified IS 'The date this source record was last edited.';
