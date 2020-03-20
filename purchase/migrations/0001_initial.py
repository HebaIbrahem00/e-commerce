# Generated by Django 3.0.3 on 2020-03-07 20:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0002_comments_favourite_reviews'),
        ('products', '0003_auto_20200307_1002'),
    ]

    operations = [
        migrations.CreateModel(
            name='Visa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cash', models.BooleanField()),
                ('cartProduct', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Product')),
                ('cartUser', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.User')),
                ('visaInfo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='purchase.Visa')),
            ],
        ),
    ]
